import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_model.freezed.dart';
part 'photo_model.g.dart';

@freezed
abstract class PhotoModel with _$PhotoModel {
  const factory PhotoModel({
    required String id,
    required String filePath,
    required DateTime capturedAt,
    required PhotoMetadata metadata,
    @Default([]) List<PhotoFilter> appliedFilters,
    @Default(PhotoStatus.captured) PhotoStatus status,
    String? compressedPath,
    String? watermarkedPath,
    int? fileSizeBytes,
    String? mimeType,
  }) = _PhotoModel;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => _$PhotoModelFromJson(json);
}

@freezed
abstract class PhotoMetadata with _$PhotoMetadata {
  const factory PhotoMetadata({required int width, required int height, double? latitude, double? longitude, String? locationName, String? deviceModel, String? cameraLens, double? exposureTime, double? fNumber, int? iso, double? focalLength, @Default({}) Map<String, dynamic> exifData}) =
      _PhotoMetadata;

  factory PhotoMetadata.fromJson(Map<String, dynamic> json) => _$PhotoMetadataFromJson(json);
}

@freezed
abstract class PhotoFilter with _$PhotoFilter {
  const factory PhotoFilter({required String name, required FilterType type, @Default(1.0) double intensity, @Default({}) Map<String, dynamic> parameters}) = _PhotoFilter;

  factory PhotoFilter.fromJson(Map<String, dynamic> json) => _$PhotoFilterFromJson(json);
}

enum PhotoStatus { captured, processing, processed, uploading, uploaded, failed }

enum FilterType { none, sepia, blackAndWhite, vintage, vibrant, cool, warm, dramatic, soft }

extension FilterTypeExtension on FilterType {
  String get displayName {
    switch (this) {
      case FilterType.none:
        return 'Original';
      case FilterType.sepia:
        return 'Sepia';
      case FilterType.blackAndWhite:
        return 'B&W';
      case FilterType.vintage:
        return 'Vintage';
      case FilterType.vibrant:
        return 'Vibrant';
      case FilterType.cool:
        return 'Cool';
      case FilterType.warm:
        return 'Warm';
      case FilterType.dramatic:
        return 'Dramatic';
      case FilterType.soft:
        return 'Soft';
    }
  }

  String get description {
    switch (this) {
      case FilterType.none:
        return 'No filter applied';
      case FilterType.sepia:
        return 'Warm brown tones';
      case FilterType.blackAndWhite:
        return 'Classic monochrome';
      case FilterType.vintage:
        return 'Retro film look';
      case FilterType.vibrant:
        return 'Enhanced colors';
      case FilterType.cool:
        return 'Cool blue tones';
      case FilterType.warm:
        return 'Warm orange tones';
      case FilterType.dramatic:
        return 'High contrast';
      case FilterType.soft:
        return 'Soft and dreamy';
    }
  }
}

extension PhotoStatusExtension on PhotoStatus {
  String get displayName {
    switch (this) {
      case PhotoStatus.captured:
        return 'Captured';
      case PhotoStatus.processing:
        return 'Processing';
      case PhotoStatus.processed:
        return 'Processed';
      case PhotoStatus.uploading:
        return 'Uploading';
      case PhotoStatus.uploaded:
        return 'Uploaded';
      case PhotoStatus.failed:
        return 'Failed';
    }
  }

  bool get isLoading {
    return this == PhotoStatus.processing || this == PhotoStatus.uploading;
  }
}
