// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => _PhotoModel(
  id: json['id'] as String,
  filePath: json['filePath'] as String,
  capturedAt: DateTime.parse(json['capturedAt'] as String),
  metadata: PhotoMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  appliedFilters:
      (json['appliedFilters'] as List<dynamic>?)
          ?.map((e) => PhotoFilter.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  status:
      $enumDecodeNullable(_$PhotoStatusEnumMap, json['status']) ??
      PhotoStatus.captured,
  compressedPath: json['compressedPath'] as String?,
  watermarkedPath: json['watermarkedPath'] as String?,
  fileSizeBytes: (json['fileSizeBytes'] as num?)?.toInt(),
  mimeType: json['mimeType'] as String?,
);

Map<String, dynamic> _$PhotoModelToJson(_PhotoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filePath': instance.filePath,
      'capturedAt': instance.capturedAt.toIso8601String(),
      'metadata': instance.metadata,
      'appliedFilters': instance.appliedFilters,
      'status': _$PhotoStatusEnumMap[instance.status]!,
      'compressedPath': instance.compressedPath,
      'watermarkedPath': instance.watermarkedPath,
      'fileSizeBytes': instance.fileSizeBytes,
      'mimeType': instance.mimeType,
    };

const _$PhotoStatusEnumMap = {
  PhotoStatus.captured: 'captured',
  PhotoStatus.processing: 'processing',
  PhotoStatus.processed: 'processed',
  PhotoStatus.uploading: 'uploading',
  PhotoStatus.uploaded: 'uploaded',
  PhotoStatus.failed: 'failed',
};

_PhotoMetadata _$PhotoMetadataFromJson(Map<String, dynamic> json) =>
    _PhotoMetadata(
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      locationName: json['locationName'] as String?,
      deviceModel: json['deviceModel'] as String?,
      cameraLens: json['cameraLens'] as String?,
      exposureTime: (json['exposureTime'] as num?)?.toDouble(),
      fNumber: (json['fNumber'] as num?)?.toDouble(),
      iso: (json['iso'] as num?)?.toInt(),
      focalLength: (json['focalLength'] as num?)?.toDouble(),
      exifData: json['exifData'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$PhotoMetadataToJson(_PhotoMetadata instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'locationName': instance.locationName,
      'deviceModel': instance.deviceModel,
      'cameraLens': instance.cameraLens,
      'exposureTime': instance.exposureTime,
      'fNumber': instance.fNumber,
      'iso': instance.iso,
      'focalLength': instance.focalLength,
      'exifData': instance.exifData,
    };

_PhotoFilter _$PhotoFilterFromJson(Map<String, dynamic> json) => _PhotoFilter(
  name: json['name'] as String,
  type: $enumDecode(_$FilterTypeEnumMap, json['type']),
  intensity: (json['intensity'] as num?)?.toDouble() ?? 1.0,
  parameters: json['parameters'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$PhotoFilterToJson(_PhotoFilter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$FilterTypeEnumMap[instance.type]!,
      'intensity': instance.intensity,
      'parameters': instance.parameters,
    };

const _$FilterTypeEnumMap = {
  FilterType.none: 'none',
  FilterType.sepia: 'sepia',
  FilterType.blackAndWhite: 'blackAndWhite',
  FilterType.vintage: 'vintage',
  FilterType.vibrant: 'vibrant',
  FilterType.cool: 'cool',
  FilterType.warm: 'warm',
  FilterType.dramatic: 'dramatic',
  FilterType.soft: 'soft',
};
