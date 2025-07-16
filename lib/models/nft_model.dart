import 'package:freezed_annotation/freezed_annotation.dart';

part 'nft_model.freezed.dart';
part 'nft_model.g.dart';

@freezed
abstract class NFTModel with _$NFTModel {
  const factory NFTModel({
    required String id,
    required String name,
    required String description,
    required String imageUrl,
    required String metadataUrl,
    required String mintAddress,
    required String ownerAddress,
    required DateTime createdAt,
    required NFTMetadata metadata,
    @Default(NFTStatus.pending) NFTStatus status,
    String? transactionSignature,
    String? arweaveId,
  }) = _NFTModel;

  factory NFTModel.fromJson(Map<String, dynamic> json) => _$NFTModelFromJson(json);
}

@freezed
abstract class NFTMetadata with _$NFTMetadata {
  const factory NFTMetadata({required String name, required String description, required String image, @Default([]) List<NFTAttribute> attributes, String? externalUrl, String? animationUrl, @Default('image') String type, @Default({}) Map<String, dynamic> properties}) = _NFTMetadata;

  factory NFTMetadata.fromJson(Map<String, dynamic> json) => _$NFTMetadataFromJson(json);
}

@freezed
abstract class NFTAttribute with _$NFTAttribute {
  const factory NFTAttribute({required String traitType, required String value, String? displayType}) = _NFTAttribute;

  factory NFTAttribute.fromJson(Map<String, dynamic> json) => _$NFTAttributeFromJson(json);
}

enum NFTStatus { pending, uploading, minting, completed, failed }

extension NFTStatusExtension on NFTStatus {
  String get displayName {
    switch (this) {
      case NFTStatus.pending:
        return 'Pending';
      case NFTStatus.uploading:
        return 'Uploading to Arweave';
      case NFTStatus.minting:
        return 'Minting NFT';
      case NFTStatus.completed:
        return 'Completed';
      case NFTStatus.failed:
        return 'Failed';
    }
  }

  bool get isLoading {
    return this == NFTStatus.uploading || this == NFTStatus.minting;
  }

  bool get isCompleted {
    return this == NFTStatus.completed;
  }

  bool get isFailed {
    return this == NFTStatus.failed;
  }
}
