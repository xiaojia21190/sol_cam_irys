import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:solana/solana.dart';
import 'package:solana_mobile_client/solana_mobile_client.dart';
import '../models/nft_model.dart';

abstract class StorageService {
  Future<String> uploadImage(File imageFile, {Map<String, String>? tags});
  Future<String> uploadMetadata(NFTMetadata metadata);
  Future<BigInt> getUploadPrice(int fileSizeBytes);
  Future<String> fundNode(BigInt lamports);
  Future<BigInt> getAccountBalance();
  Future<String> getUploadUrl(String arweaveId);
  Future<bool> verifyUpload(String arweaveId);
  void updateWalletCredentials(String? authToken, Uint8List? publicKey);
}

class IrysStorageService implements StorageService {
  final String _nodeUrl;
  final SolanaClient _solanaClient;
  String? _authToken;
  Uint8List? _publicKey;

  IrysStorageService({required String nodeUrl, required SolanaClient solanaClient, String? authToken, Uint8List? publicKey}) : _nodeUrl = nodeUrl, _solanaClient = solanaClient, _authToken = authToken, _publicKey = publicKey;

  @override
  Future<String> uploadImage(File imageFile, {Map<String, String>? tags}) async {
    try {
      // Read file as bytes
      final Uint8List imageBytes = await imageFile.readAsBytes();

      // Prepare tags
      final uploadTags = <String, String>{'Content-Type': 'image/jpeg', 'App-Name': 'SolanaLens', 'App-Version': '1.0.0', 'Type': 'image', ...?tags};

      // Upload to Irys
      final arweaveId = await _uploadToIrys(imageBytes, uploadTags);

      return arweaveId;
    } catch (e) {
      throw StorageException('Failed to upload image: $e');
    }
  }

  @override
  Future<String> uploadMetadata(NFTMetadata metadata) async {
    try {
      // Convert metadata to JSON bytes
      final metadataJson = metadata.toJson();
      final jsonString = jsonEncode(metadataJson);
      final Uint8List metadataBytes = Uint8List.fromList(utf8.encode(jsonString));

      // Prepare tags
      final uploadTags = <String, String>{'Content-Type': 'application/json', 'App-Name': 'SolanaLens', 'App-Version': '1.0.0', 'Type': 'metadata'};

      // Upload to Irys
      final arweaveId = await _uploadToIrys(metadataBytes, uploadTags);

      return arweaveId;
    } catch (e) {
      throw StorageException('Failed to upload metadata: $e');
    }
  }

  @override
  Future<BigInt> getUploadPrice(int fileSizeBytes) async {
    try {
      final response = await http.get(Uri.parse('$_nodeUrl/price/sol/$fileSizeBytes'));

      if (response.statusCode == 200) {
        // Irys 返回的是一个纯文本的数字字符串，表示 Lamports
        return BigInt.parse(response.body);
      } else {
        throw StorageException('Failed to get price: ${response.body}');
      }
    } catch (e) {
      throw StorageException('Error getting upload price: $e');
    }
  }

  @override
  Future<String> fundNode(BigInt lamports) async {
    try {
      if (_authToken == null || _publicKey == null) {
        throw StorageException('Wallet not connected');
      }

      // 1. 获取 Irys 节点的 Solana 地址
      final infoResponse = await http.get(Uri.parse('$_nodeUrl/info'));
      if (infoResponse.statusCode != 200) {
        throw StorageException('Failed to get node info: ${infoResponse.body}');
      }

      final nodeInfo = jsonDecode(infoResponse.body);
      final nodeAddress = nodeInfo['addresses']['solana'];

      // 2. 构建真正的 Solana 转账交易
      final fromPublicKey = Ed25519HDPublicKey(_publicKey!);
      final toPublicKey = Ed25519HDPublicKey.fromBase58(nodeAddress);

      // 创建转账指令
      final transferInstruction = SystemInstruction.transfer(fundingAccount: fromPublicKey, recipientAccount: toPublicKey, lamports: lamports.toInt());

      // 获取最新的区块哈希
      final latestBlockhash = await _solanaClient.rpcClient.getLatestBlockhash();

      // 构建消息
      final message = Message(instructions: [transferInstruction]);
      final compiledMessage = message.compile(recentBlockhash: latestBlockhash.value.blockhash, feePayer: fromPublicKey);

      // 3. 使用 Solana Mobile Wallet Adapter 签名并发送交易
      final session = await LocalAssociationScenario.create();
      await session.startActivityForResult(null);
      final client = await session.start();

      try {
        await client.reauthorize(authToken: _authToken!);

        // 发送交易进行签名和广播
        final result = await client.signAndSendTransactions(transactions: [Uint8List.fromList(compiledMessage.toByteArray().toList())]);

        if (result.signatures.isEmpty) {
          throw StorageException('No signature returned from wallet');
        }

        final signature = result.signatures.first.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

        // 4. 等待交易确认
        await _waitForTransactionConfirmation(signature);

        return signature;
      } finally {
        await session.close();
      }
    } catch (e) {
      throw StorageException('Failed to fund node: $e');
    }
  }

  /// 等待交易确认
  Future<void> _waitForTransactionConfirmation(String signature) async {
    const maxRetries = 30;
    const retryDelay = Duration(seconds: 2);

    for (int i = 0; i < maxRetries; i++) {
      try {
        final status = await _solanaClient.rpcClient.getSignatureStatuses([signature]);
        if (status.value.isNotEmpty) {
          final signatureStatus = status.value.first;
          if (signatureStatus?.confirmationStatus != null) {
            // 交易已确认
            return;
          }
        }
      } catch (e) {
        // 忽略查询错误，继续重试
      }

      await Future.delayed(retryDelay);
    }

    throw StorageException('Transaction confirmation timeout');
  }

  @override
  Future<BigInt> getAccountBalance() async {
    try {
      if (_publicKey == null) {
        throw StorageException('Wallet not connected');
      }

      final userAddress = Ed25519HDPublicKey(_publicKey!).toBase58();
      final response = await http.get(Uri.parse('$_nodeUrl/account/balance/sol?address=$userAddress'));

      if (response.statusCode == 200) {
        // Irys 返回账户余额，单位为 Lamports
        return BigInt.parse(response.body);
      } else {
        throw StorageException('Failed to get balance: ${response.body}');
      }
    } catch (e) {
      throw StorageException('Failed to get account balance: $e');
    }
  }

  @override
  Future<String> getUploadUrl(String arweaveId) async {
    return 'https://gateway.irys.xyz/$arweaveId';
  }

  @override
  Future<bool> verifyUpload(String arweaveId) async {
    try {
      // Implementation would verify the upload exists on Arweave
      // This is a placeholder implementation
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> _uploadToIrys(Uint8List data, Map<String, String> tags) async {
    try {
      final headers = <String, String>{'Content-Type': 'application/octet-stream'};

      // 添加 Arweave tags 作为 HTTP headers
      for (final entry in tags.entries) {
        headers['x-tx-tag-${entry.key}'] = entry.value;
      }

      final response = await http.post(Uri.parse('$_nodeUrl/tx/sol'), headers: headers, body: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body);
        final txId = body['id'];
        return txId;
      } else {
        throw StorageException('Upload failed: ${response.body}');
      }
    } catch (e) {
      throw StorageException('Error uploading data: $e');
    }
  }

  @override
  void updateWalletCredentials(String? authToken, Uint8List? publicKey) {
    _authToken = authToken;
    _publicKey = publicKey;
  }
}

class StorageException implements Exception {
  final String message;

  StorageException(this.message);

  @override
  String toString() => 'StorageException: $message';
}
