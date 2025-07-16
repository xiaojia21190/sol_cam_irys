// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NFTModel _$NFTModelFromJson(Map<String, dynamic> json) => _NFTModel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  imageUrl: json['imageUrl'] as String,
  metadataUrl: json['metadataUrl'] as String,
  mintAddress: json['mintAddress'] as String,
  ownerAddress: json['ownerAddress'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  metadata: NFTMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  status:
      $enumDecodeNullable(_$NFTStatusEnumMap, json['status']) ??
      NFTStatus.pending,
  transactionSignature: json['transactionSignature'] as String?,
  arweaveId: json['arweaveId'] as String?,
);

Map<String, dynamic> _$NFTModelToJson(_NFTModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'imageUrl': instance.imageUrl,
  'metadataUrl': instance.metadataUrl,
  'mintAddress': instance.mintAddress,
  'ownerAddress': instance.ownerAddress,
  'createdAt': instance.createdAt.toIso8601String(),
  'metadata': instance.metadata,
  'status': _$NFTStatusEnumMap[instance.status]!,
  'transactionSignature': instance.transactionSignature,
  'arweaveId': instance.arweaveId,
};

const _$NFTStatusEnumMap = {
  NFTStatus.pending: 'pending',
  NFTStatus.uploading: 'uploading',
  NFTStatus.minting: 'minting',
  NFTStatus.completed: 'completed',
  NFTStatus.failed: 'failed',
};

_NFTMetadata _$NFTMetadataFromJson(Map<String, dynamic> json) => _NFTMetadata(
  name: json['name'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  attributes:
      (json['attributes'] as List<dynamic>?)
          ?.map((e) => NFTAttribute.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  externalUrl: json['externalUrl'] as String?,
  animationUrl: json['animationUrl'] as String?,
  type: json['type'] as String? ?? 'image',
  properties: json['properties'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$NFTMetadataToJson(_NFTMetadata instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'attributes': instance.attributes,
      'externalUrl': instance.externalUrl,
      'animationUrl': instance.animationUrl,
      'type': instance.type,
      'properties': instance.properties,
    };

_NFTAttribute _$NFTAttributeFromJson(Map<String, dynamic> json) =>
    _NFTAttribute(
      traitType: json['traitType'] as String,
      value: json['value'] as String,
      displayType: json['displayType'] as String?,
    );

Map<String, dynamic> _$NFTAttributeToJson(_NFTAttribute instance) =>
    <String, dynamic>{
      'traitType': instance.traitType,
      'value': instance.value,
      'displayType': instance.displayType,
    };
