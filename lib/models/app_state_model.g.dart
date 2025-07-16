// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppStateModel _$AppStateModelFromJson(Map<String, dynamic> json) =>
    _AppStateModel(
      status:
          $enumDecodeNullable(_$AppStatusEnumMap, json['status']) ??
          AppStatus.initializing,
      connectedWallet: json['connectedWallet'] == null
          ? null
          : WalletModel.fromJson(
              json['connectedWallet'] as Map<String, dynamic>,
            ),
      userNFTs:
          (json['userNFTs'] as List<dynamic>?)
              ?.map((e) => NFTModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      capturedPhotos:
          (json['capturedPhotos'] as List<dynamic>?)
              ?.map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      settings: json['settings'] == null
          ? const AppSettings()
          : AppSettings.fromJson(json['settings'] as Map<String, dynamic>),
      errorMessage: json['errorMessage'] as String?,
      isOnline: json['isOnline'] as bool? ?? false,
      hasPermissions: json['hasPermissions'] as bool? ?? false,
    );

Map<String, dynamic> _$AppStateModelToJson(_AppStateModel instance) =>
    <String, dynamic>{
      'status': _$AppStatusEnumMap[instance.status]!,
      'connectedWallet': instance.connectedWallet,
      'userNFTs': instance.userNFTs,
      'capturedPhotos': instance.capturedPhotos,
      'settings': instance.settings,
      'errorMessage': instance.errorMessage,
      'isOnline': instance.isOnline,
      'hasPermissions': instance.hasPermissions,
    };

const _$AppStatusEnumMap = {
  AppStatus.initializing: 'initializing',
  AppStatus.ready: 'ready',
  AppStatus.loading: 'loading',
  AppStatus.error: 'error',
  AppStatus.offline: 'offline',
};

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  enableGeolocation: json['enableGeolocation'] as bool? ?? true,
  enableWatermark: json['enableWatermark'] as bool? ?? true,
  defaultFilter:
      $enumDecodeNullable(_$FilterTypeEnumMap, json['defaultFilter']) ??
      FilterType.none,
  imageQuality:
      $enumDecodeNullable(_$ImageQualityEnumMap, json['imageQuality']) ??
      ImageQuality.high,
  network:
      $enumDecodeNullable(_$NetworkTypeEnumMap, json['network']) ??
      NetworkType.testnet,
  autoUpload: json['autoUpload'] as bool? ?? true,
  enableNotifications: json['enableNotifications'] as bool? ?? true,
  enableAnalytics: json['enableAnalytics'] as bool? ?? false,
  language: json['language'] as String? ?? 'en',
  themeMode:
      $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
      ThemeMode.system,
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'enableGeolocation': instance.enableGeolocation,
      'enableWatermark': instance.enableWatermark,
      'defaultFilter': _$FilterTypeEnumMap[instance.defaultFilter]!,
      'imageQuality': _$ImageQualityEnumMap[instance.imageQuality]!,
      'network': _$NetworkTypeEnumMap[instance.network]!,
      'autoUpload': instance.autoUpload,
      'enableNotifications': instance.enableNotifications,
      'enableAnalytics': instance.enableAnalytics,
      'language': instance.language,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
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

const _$ImageQualityEnumMap = {
  ImageQuality.low: 'low',
  ImageQuality.medium: 'medium',
  ImageQuality.high: 'high',
  ImageQuality.original: 'original',
};

const _$NetworkTypeEnumMap = {
  NetworkType.devnet: 'devnet',
  NetworkType.testnet: 'testnet',
  NetworkType.mainnet: 'mainnet',
};

const _$ThemeModeEnumMap = {
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
  ThemeMode.system: 'system',
};

_UploadProgress _$UploadProgressFromJson(Map<String, dynamic> json) =>
    _UploadProgress(
      id: json['id'] as String,
      fileName: json['fileName'] as String,
      stage: $enumDecode(_$UploadStageEnumMap, json['stage']),
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
      errorMessage: json['errorMessage'] as String?,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$UploadProgressToJson(_UploadProgress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileName': instance.fileName,
      'stage': _$UploadStageEnumMap[instance.stage]!,
      'progress': instance.progress,
      'errorMessage': instance.errorMessage,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
    };

const _$UploadStageEnumMap = {
  UploadStage.preparing: 'preparing',
  UploadStage.compressing: 'compressing',
  UploadStage.uploading: 'uploading',
  UploadStage.minting: 'minting',
  UploadStage.completed: 'completed',
  UploadStage.failed: 'failed',
};
