import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/nft_model.dart';
import 'app_state_provider.dart';

part 'mint_process_provider.g.dart';

/// NFT 铸造流程的状态
enum MintProcessStage { idle, calculatingPrice, fundingNode, uploadingImage, uploadingMetadata, creatingNFT, completed, failed }

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
  Future<void> startMinting({required File imageFile, required String nftName, required String nftDescription, Map<String, String>? additionalTags}) async {
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

      // 步骤 1: 计算上传价格
      _updateState(stage: MintProcessStage.calculatingPrice, message: '1/6: 计算存储费用...', progress: 0.1);

      final imageBytes = await imageFile.readAsBytes();
      final imagePrice = await storageService.getUploadPrice(imageBytes.length);

      // 估算 metadata JSON 大小（约 1KB）
      const estimatedMetadataSize = 1024;
      final metadataPrice = await storageService.getUploadPrice(estimatedMetadataSize);
      final totalPrice = imagePrice + metadataPrice;

      // 步骤 2: 充值 Irys 节点
      _updateState(stage: MintProcessStage.fundingNode, message: '2/6: 充值存储节点... 请在钱包中确认交易', progress: 0.2);

      await storageService.fundNode(totalPrice);

      // 步骤 3: 上传图片
      _updateState(stage: MintProcessStage.uploadingImage, message: '3/6: 上传图片到 Arweave...', progress: 0.4);

      final imageArweaveId = await storageService.uploadImage(imageFile, tags: additionalTags);
      final imageUrl = await storageService.getUploadUrl(imageArweaveId);

      // 步骤 4: 创建并上传 metadata
      _updateState(stage: MintProcessStage.uploadingMetadata, message: '4/6: 上传 NFT 元数据...', progress: 0.6);

      final metadata = NFTMetadata(
        name: nftName,
        description: nftDescription,
        image: imageUrl,
        attributes: [
          const NFTAttribute(traitType: 'App', value: 'SolanaLens'),
          const NFTAttribute(traitType: 'Version', value: '1.0.0'),
        ],
        properties: {
          'files': [
            {'uri': imageUrl, 'type': 'image/jpeg'},
          ],
          'category': 'image',
        },
      );

      final metadataArweaveId = await storageService.uploadMetadata(metadata);
      final metadataUrl = await storageService.getUploadUrl(metadataArweaveId);

      // 步骤 5: 铸造 NFT
      _updateState(stage: MintProcessStage.creatingNFT, message: '5/6: 铸造 NFT... 请在钱包中确认交易', progress: 0.8);

      final mintSignature = await solanaService.mintNFT(metadataUri: metadataUrl, name: nftName, symbol: 'SLENS', walletAddress: appState.connectedWallet!.publicKey);

      // 步骤 6: 完成
      final completedNFT = NFTModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nftName,
        description: nftDescription,
        imageUrl: imageUrl,
        metadataUrl: metadataUrl,
        mintAddress: 'mock_mint_address', // 实际应该从铸造交易中获取
        ownerAddress: appState.connectedWallet!.publicKey,
        createdAt: DateTime.now(),
        metadata: metadata,
        status: NFTStatus.completed,
        transactionSignature: mintSignature,
        arweaveId: imageArweaveId,
      );

      _updateState(stage: MintProcessStage.completed, message: '6/6: NFT 铸造完成！', progress: 1.0, transactionSignature: mintSignature, arweaveImageUrl: imageUrl, arweaveMetadataUrl: metadataUrl, completedNFT: completedNFT);

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
