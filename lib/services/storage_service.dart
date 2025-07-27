import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/nft_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

abstract class StorageService {
  Future<String> uploadImage(File imageFile, {Map<String, String>? tags});
  Future<String> uploadMetadata(NFTMetadata metadata);
  Future<BigInt> getUploadPrice(int fileSizeBytes);
  Future<String> fundNode(BigInt lamports);
  Future<BigInt> getAccountBalance();
  Future<String> getUploadUrl(String arweaveId);
  Future<bool> verifyUpload(String arweaveId);
  void updateWalletCredentials(String? authToken, Uint8List? publicKey);

  // 新增：支持公共存储选项
  Future<String> uploadImagePublic(File imageFile, {Map<String, String>? tags});
  Future<String> uploadMetadataPublic(NFTMetadata metadata);

  // 新增：组合上传方法（仅 IrysServerStorageService 支持）
  Future<Map<String, String>> uploadComplete(File imageFile, NFTMetadata metadata);
}

/// Irys 服务器存储实现 - 通过API服务器上传到Irys网络
class IrysServerStorageService implements StorageService {
  final String _serverBaseUrl;
  final http.Client _httpClient;

  IrysServerStorageService({required String serverBaseUrl, http.Client? httpClient}) : _serverBaseUrl = serverBaseUrl.endsWith('/') ? serverBaseUrl.substring(0, serverBaseUrl.length - 1) : serverBaseUrl, _httpClient = httpClient ?? http.Client();

  @override
  Future<String> uploadImage(File imageFile, {Map<String, String>? tags}) async {
    try {
      print('🚀 开始上传图片到 Irys 服务器...');
      print('📁 文件: ${imageFile.path}');
      print('🌐 服务器: $_serverBaseUrl');

      // 检查文件是否存在
      if (!await imageFile.exists()) {
        throw StorageException('Image file does not exist: ${imageFile.path}');
      }

      // 创建 multipart 请求
      final request = http.MultipartRequest('POST', Uri.parse('$_serverBaseUrl/api/upload/image'));

      // 添加文件
      final fileStream = http.ByteStream(imageFile.openRead());
      final fileLength = await imageFile.length();
      final multipartFile = http.MultipartFile(
        'file',
        fileStream,
        fileLength,
        filename: path.basename(imageFile.path),
        contentType: MediaType('image', 'jpeg'), // 默认JPEG，可以根据文件扩展名调整
      );
      request.files.add(multipartFile);

      // 添加标签作为额外字段（如果有）
      if (tags != null) {
        for (final entry in tags.entries) {
          request.fields[entry.key] = entry.value;
        }
      }

      print('📤 发送上传请求...');
      final streamedResponse = await _httpClient.send(request);
      final response = await http.Response.fromStream(streamedResponse);

      print('📥 服务器响应状态: ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('✅ 上传成功！响应: ${response.body}');

        if (responseData['success'] == true && responseData['data'] != null) {
          final data = responseData['data'];
          final irysId = data['irysId'] as String;
          final url = data['url'] as String;

          print('🎉 Irys ID: $irysId');
          print('🔗 URL: $url');

          return irysId; // 返回 Irys ID 作为标识符
        } else {
          throw StorageException('Invalid response format: ${response.body}');
        }
      } else {
        print('❌ 上传失败: ${response.statusCode} - ${response.body}');
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['error'] ?? 'Upload failed';
        throw StorageException('Failed to upload image: $errorMessage');
      }
    } catch (e) {
      print('❌ 图片上传异常: $e');
      throw StorageException('Failed to upload image to Irys server: $e');
    }
  }

  @override
  Future<String> uploadMetadata(NFTMetadata metadata) async {
    try {
      print('🚀 开始上传 metadata 到 Irys 服务器...');

      // 准备 metadata JSON
      final metadataJson = metadata.toJson();
      final requestBody = {'metadata': metadataJson};

      print('📤 发送 metadata 上传请求...');
      final response = await _httpClient.post(Uri.parse('$_serverBaseUrl/api/upload/metadata'), headers: {'Content-Type': 'application/json'}, body: jsonEncode(requestBody));

      print('📥 服务器响应状态: ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('✅ Metadata 上传成功！响应: ${response.body}');

        if (responseData['success'] == true && responseData['data'] != null) {
          final data = responseData['data'];
          final irysId = data['irysId'] as String;
          final url = data['url'] as String;

          print('🎉 Metadata Irys ID: $irysId');
          print('🔗 Metadata URL: $url');

          return irysId; // 返回 Irys ID 作为标识符
        } else {
          throw StorageException('Invalid metadata response format: ${response.body}');
        }
      } else {
        print('❌ Metadata 上传失败: ${response.statusCode} - ${response.body}');
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['error'] ?? 'Metadata upload failed';
        throw StorageException('Failed to upload metadata: $errorMessage');
      }
    } catch (e) {
      print('❌ Metadata 上传异常: $e');
      throw StorageException('Failed to upload metadata to Irys server: $e');
    }
  }

  /// 组合上传图片和 metadata（使用服务器的 /api/upload/complete 端点）
  @override
  Future<Map<String, String>> uploadComplete(File imageFile, NFTMetadata metadata) async {
    try {
      print('🚀 开始组合上传到 Irys 服务器...');

      // 检查文件是否存在
      if (!await imageFile.exists()) {
        throw StorageException('Image file does not exist: ${imageFile.path}');
      }

      // 创建 multipart 请求
      final request = http.MultipartRequest('POST', Uri.parse('$_serverBaseUrl/api/upload/complete'));

      // 添加图片文件
      final fileStream = http.ByteStream(imageFile.openRead());
      final fileLength = await imageFile.length();
      final multipartFile = http.MultipartFile('file', fileStream, fileLength, filename: path.basename(imageFile.path), contentType: MediaType('image', 'jpeg'));
      request.files.add(multipartFile);

      // 添加 metadata 作为 JSON 字符串
      final metadataJson = metadata.toJson();
      request.fields['metadata'] = jsonEncode(metadataJson);

      print('📤 发送组合上传请求...');
      final streamedResponse = await _httpClient.send(request);
      final response = await http.Response.fromStream(streamedResponse);

      print('📥 服务器响应状态: ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('✅ 组合上传成功！响应: ${response.body}');

        if (responseData['success'] == true && responseData['data'] != null) {
          final data = responseData['data'];
          final imageData = data['image'];
          final metadataData = data['metadata'];

          final imageIrysId = imageData['irysId'] as String;
          final imageUrl = imageData['url'] as String;
          final metadataIrysId = metadataData['irysId'] as String;
          final metadataUrl = metadataData['url'] as String;

          print('🎉 图片 Irys ID: $imageIrysId');
          print('🔗 图片 URL: $imageUrl');
          print('🎉 Metadata Irys ID: $metadataIrysId');
          print('🔗 Metadata URL: $metadataUrl');

          return {'imageIrysId': imageIrysId, 'imageUrl': imageUrl, 'metadataIrysId': metadataIrysId, 'metadataUrl': metadataUrl};
        } else {
          throw StorageException('Invalid complete upload response format: ${response.body}');
        }
      } else {
        print('❌ 组合上传失败: ${response.statusCode} - ${response.body}');
        final errorData = jsonDecode(response.body);
        final errorMessage = errorData['error'] ?? 'Complete upload failed';
        throw StorageException('Failed to complete upload: $errorMessage');
      }
    } catch (e) {
      print('❌ 组合上传异常: $e');
      throw StorageException('Failed to complete upload to Irys server: $e');
    }
  }

  @override
  Future<BigInt> getUploadPrice(int fileSizeBytes) async {
    // Irys 服务器端处理价格计算，客户端返回0表示免费
    return BigInt.zero;
  }

  @override
  Future<String> fundNode(BigInt lamports) async {
    // Irys 服务器端处理资金，客户端不需要操作
    return 'irys_server_funded_${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  Future<BigInt> getAccountBalance() async {
    // 服务器端管理余额，客户端返回充足的虚拟余额
    return BigInt.from(1000000000); // 1 SOL in lamports
  }

  @override
  Future<String> getUploadUrl(String irysId) async {
    // 直接返回 Irys Gateway URL
    return 'https://gateway.irys.xyz/$irysId';
  }

  @override
  Future<bool> verifyUpload(String irysId) async {
    try {
      // 验证 Irys 上的文件是否可访问
      final url = 'https://gateway.irys.xyz/$irysId';
      final response = await _httpClient.head(Uri.parse(url));
      return response.statusCode == 200;
    } catch (e) {
      print('❌ 验证上传失败: $e');
      return false;
    }
  }

  @override
  void updateWalletCredentials(String? authToken, Uint8List? publicKey) {
    // Irys 服务器端处理钱包凭据，客户端不需要存储
  }

  @override
  Future<String> uploadImagePublic(File imageFile, {Map<String, String>? tags}) async {
    // Irys 上传本身就是公共的，直接调用普通上传
    final irysId = await uploadImage(imageFile, tags: tags);
    return await getUploadUrl(irysId);
  }

  @override
  Future<String> uploadMetadataPublic(NFTMetadata metadata) async {
    // Irys 上传本身就是公共的，直接调用普通上传
    final irysId = await uploadMetadata(metadata);
    return await getUploadUrl(irysId);
  }

  /// 检查服务器状态
  Future<bool> checkServerStatus() async {
    try {
      print('🔍 检查 Irys 服务器状态...');
      final response = await _httpClient.get(Uri.parse('$_serverBaseUrl/api/status'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('✅ 服务器状态: ${response.body}');
        return data['success'] == true;
      } else {
        print('❌ 服务器状态检查失败: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('❌ 服务器连接失败: $e');
      return false;
    }
  }

  /// 清理资源
  void dispose() {
    _httpClient.close();
  }
}

class StorageException implements Exception {
  final String message;

  StorageException(this.message);

  @override
  String toString() => 'StorageException: $message';
}
