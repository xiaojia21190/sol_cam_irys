import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/nft_model.dart';
import '../services/storage_service.dart';
import 'app_state_provider.dart';

part 'mint_process_provider.g.dart';

/// NFT 铸造流程的状态
enum MintProcessStage { idle, savingImage, savingMetadata, creatingNFT, completed, failed }

/// NFT 铸造流程状态模型
class MintProcessState {
  final MintProcessStage stage;
  final String? message;
  final double progress; // 0.0 - 1.0
  final String? errorMessage;
  final String? transactionSignature;
  final String? arweaveImageUrl;
  final String? arweaveMetadataUrl;
  final NFTModel? completedNFT;

  const MintProcessState({required this.stage, this.message, this.progress = 0.0, this.errorMessage, this.transactionSignature, this.arweaveImageUrl, this.arweaveMetadataUrl, this.completedNFT});

  MintProcessState copyWith({MintProcessStage? stage, String? message, double? progress, String? errorMessage, String? transactionSignature, String? arweaveImageUrl, String? arweaveMetadataUrl, NFTModel? completedNFT}) {
    return MintProcessState(
      stage: stage ?? this.stage,
      message: message ?? this.message,
      progress: progress ?? this.progress,
      errorMessage: errorMessage ?? this.errorMessage,
      transactionSignature: transactionSignature ?? this.transactionSignature,
      arweaveImageUrl: arweaveImageUrl ?? this.arweaveImageUrl,
      arweaveMetadataUrl: arweaveMetadataUrl ?? this.arweaveMetadataUrl,
      completedNFT: completedNFT ?? this.completedNFT,
    );
  }

  bool get isLoading => stage != MintProcessStage.idle && stage != MintProcessStage.completed && stage != MintProcessStage.failed;

  bool get isCompleted => stage == MintProcessStage.completed;
  bool get isFailed => stage == MintProcessStage.failed;
}

/// NFT 铸造流程管理器
@riverpod
class MintProcess extends _$MintProcess {
  @override
  MintProcessState build() {
    return const MintProcessState(stage: MintProcessStage.idle);
  }

  /// 开始 NFT 铸造流程
  Future<void> startMinting({
    required File imageFile,
    required String nftName,
    required String nftDescription,
    Map<String, String>? additionalTags,
    bool usePublicStorage = false, // 新增：是否使用公共存储
  }) async {
    try {
      // 重置状态
      state = const MintProcessState(stage: MintProcessStage.idle);

      final storageService = ref.read(storageServiceProvider);
      final solanaService = ref.read(solanaServiceProvider);
      final appState = ref.read(appStateProvider);

      // 检查钱包连接
      if (appState.connectedWallet == null) {
        _setError('请先连接钱包');
        return;
      }

      // 检测是否为 Irys 服务器存储（支持组合上传）
      final isIrysServer = storageService is IrysServerStorageService;

      String imageLocalPath;
      String imageUrl;
      String metadataLocalPath;
      String metadataUrl;

      if (isIrysServer && usePublicStorage) {
        // 使用 Irys 服务器的组合上传功能
        _updateState(stage: MintProcessStage.savingImage, message: '1/2: 正在上传到 Irys 网络...', progress: 0.3);

        // 首先创建临时的 metadata（需要先有图片URL）
        final tempMetadata = NFTMetadata(
          name: nftName,
          description: nftDescription,
          image: 'placeholder', // 临时占位符
          attributes: [
            const NFTAttribute(traitType: 'App', value: 'SolanaLens'),
            const NFTAttribute(traitType: 'Version', value: '1.0.0'),
            const NFTAttribute(traitType: 'Storage', value: 'Irys'),
          ],
          properties: {
            'files': [
              {'uri': 'placeholder', 'type': 'image/jpeg'},
            ],
            'category': 'image',
          },
        );

        // 使用组合上传
        final irysService = storageService as IrysServerStorageService;
        final uploadResult = await irysService.uploadComplete(imageFile, tempMetadata);

        imageLocalPath = uploadResult['imageIrysId']!;
        imageUrl = uploadResult['imageUrl']!;
        metadataLocalPath = uploadResult['metadataIrysId']!;
        metadataUrl = uploadResult['metadataUrl']!;

        _updateState(stage: MintProcessStage.savingMetadata, message: '2/2: Irys 上传完成！', progress: 0.6);
      } else {
        // 传统的分步上传
        // 步骤 1: 保存图片
        if (usePublicStorage) {
          _updateState(stage: MintProcessStage.savingImage, message: '1/3: 上传图片到公共存储...', progress: 0.2);
        } else {
          _updateState(stage: MintProcessStage.savingImage, message: '1/3: 保存图片到本地...', progress: 0.2);
        }

        if (usePublicStorage) {
          imageLocalPath = await storageService.uploadImagePublic(imageFile, tags: additionalTags);
          imageUrl = imageLocalPath; // 公共存储直接返回URL
        } else {
          imageLocalPath = await storageService.uploadImage(imageFile, tags: additionalTags);
          imageUrl = await storageService.getUploadUrl(imageLocalPath);
        }

        // 步骤 2: 创建并保存 metadata
        if (usePublicStorage) {
          _updateState(stage: MintProcessStage.savingMetadata, message: '2/3: 上传 NFT 元数据到公共存储...', progress: 0.4);
        } else {
          _updateState(stage: MintProcessStage.savingMetadata, message: '2/3: 保存 NFT 元数据到本地...', progress: 0.4);
        }

        final metadata = NFTMetadata(
          name: nftName,
          description: nftDescription,
          image: imageUrl,
          attributes: [
            const NFTAttribute(traitType: 'App', value: 'SolanaLens'),
            const NFTAttribute(traitType: 'Version', value: '1.0.0'),
            NFTAttribute(traitType: 'Storage', value: usePublicStorage ? 'Public' : 'Local'),
          ],
          properties: {
            'files': [
              {'uri': imageUrl, 'type': 'image/jpeg'},
            ],
            'category': 'image',
          },
        );

        if (usePublicStorage) {
          metadataLocalPath = await storageService.uploadMetadataPublic(metadata);
          metadataUrl = metadataLocalPath; // 公共存储直接返回URL
        } else {
          metadataLocalPath = await storageService.uploadMetadata(metadata);
          metadataUrl = await storageService.getUploadUrl(metadataLocalPath);
        }
      }

      // 为了铸造 NFT，创建完整的 metadata（不管是组合上传还是分步上传）
      final finalMetadata = NFTMetadata(
        name: nftName,
        description: nftDescription,
        image: imageUrl,
        attributes: [
          const NFTAttribute(traitType: 'App', value: 'SolanaLens'),
          const NFTAttribute(traitType: 'Version', value: '1.0.0'),
          NFTAttribute(traitType: 'Storage', value: isIrysServer && usePublicStorage ? 'Irys' : (usePublicStorage ? 'Public' : 'Local')),
        ],
        properties: {
          'files': [
            {'uri': imageUrl, 'type': 'image/jpeg'},
          ],
          'category': 'image',
        },
      );

      // 步骤 3: 铸造 NFT
      _updateState(stage: MintProcessStage.creatingNFT, message: '3/3: 铸造 NFT... 请在钱包中确认交易', progress: 0.8);

      final mintSignature = await solanaService.mintNFT(metadataUri: metadataUrl, name: nftName, symbol: 'SLENS', walletAddress: appState.connectedWallet!.publicKey);

      // 步骤 4: 完成
      final completedNFT = NFTModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nftName,
        description: nftDescription,
        imageUrl: imageUrl,
        metadataUrl: metadataUrl,
        mintAddress: 'mock_mint_address', // 实际应该从铸造交易中获取
        ownerAddress: appState.connectedWallet!.publicKey,
        createdAt: DateTime.now(),
        metadata: finalMetadata,
        status: NFTStatus.completed,
        transactionSignature: mintSignature,
        arweaveId: imageLocalPath, // 现在保存本地路径
      );

      _updateState(stage: MintProcessStage.completed, message: 'NFT 铸造完成！', progress: 1.0, transactionSignature: mintSignature, arweaveImageUrl: imageUrl, arweaveMetadataUrl: metadataUrl, completedNFT: completedNFT);

      // 将 NFT 添加到应用状态
      ref.read(appStateProvider.notifier).addNFT(completedNFT);
    } catch (e) {
      _setError('铸造失败: $e');
    }
  }

  /// 重置流程状态
  void reset() {
    state = const MintProcessState(stage: MintProcessStage.idle);
  }

  /// 更新状态
  void _updateState({MintProcessStage? stage, String? message, double? progress, String? transactionSignature, String? arweaveImageUrl, String? arweaveMetadataUrl, NFTModel? completedNFT}) {
    state = state.copyWith(stage: stage, message: message, progress: progress, transactionSignature: transactionSignature, arweaveImageUrl: arweaveImageUrl, arweaveMetadataUrl: arweaveMetadataUrl, completedNFT: completedNFT);
  }

  /// 设置错误状态
  void _setError(String error) {
    state = state.copyWith(stage: MintProcessStage.failed, errorMessage: error, message: '铸造失败');
  }
}

/// 便捷的状态访问器
@riverpod
bool isMintingInProgress(Ref ref) {
  final mintState = ref.watch(mintProcessProvider);
  return mintState.isLoading;
}

@riverpod
double mintingProgress(Ref ref) {
  final mintState = ref.watch(mintProcessProvider);
  return mintState.progress;
}

@riverpod
String? mintingMessage(Ref ref) {
  final mintState = ref.watch(mintProcessProvider);
  return mintState.message;
}
