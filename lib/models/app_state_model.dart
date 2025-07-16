import 'package:freezed_annotation/freezed_annotation.dart';
import 'wallet_model.dart';
import 'nft_model.dart';
import 'photo_model.dart';

part 'app_state_model.freezed.dart';
part 'app_state_model.g.dart';

@freezed
abstract class AppStateModel with _$AppStateModel {
  const factory AppStateModel({
    @Default(AppStatus.initializing) AppStatus status,
    WalletModel? connectedWallet,
    @Default([]) List<NFTModel> userNFTs,
    @Default([]) List<PhotoModel> capturedPhotos,
    @Default(AppSettings()) AppSettings settings,
    String? errorMessage,
    @Default(false) bool isOnline,
    @Default(false) bool hasPermissions,
  }) = _AppStateModel;

  factory AppStateModel.fromJson(Map<String, dynamic> json) => _$AppStateModelFromJson(json);
}

@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(true) bool enableGeolocation,
    @Default(true) bool enableWatermark,
    @Default(FilterType.none) FilterType defaultFilter,
    @Default(ImageQuality.high) ImageQuality imageQuality,
    @Default(NetworkType.testnet) NetworkType network,
    @Default(true) bool autoUpload,
    @Default(true) bool enableNotifications,
    @Default(false) bool enableAnalytics,
    @Default('en') String language,
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);
}

@freezed
abstract class UploadProgress with _$UploadProgress {
  const factory UploadProgress({required String id, required String fileName, required UploadStage stage, @Default(0.0) double progress, String? errorMessage, DateTime? startTime, DateTime? endTime}) = _UploadProgress;

  factory UploadProgress.fromJson(Map<String, dynamic> json) => _$UploadProgressFromJson(json);
}

enum AppStatus { initializing, ready, loading, error, offline }

enum ImageQuality { low, medium, high, original }

enum NetworkType { devnet, testnet, mainnet }

enum ThemeMode { light, dark, system }

enum UploadStage { preparing, compressing, uploading, minting, completed, failed }

extension AppStatusExtension on AppStatus {
  String get displayName {
    switch (this) {
      case AppStatus.initializing:
        return 'Initializing...';
      case AppStatus.ready:
        return 'Ready';
      case AppStatus.loading:
        return 'Loading...';
      case AppStatus.error:
        return 'Error';
      case AppStatus.offline:
        return 'Offline';
    }
  }

  bool get isLoading {
    return this == AppStatus.initializing || this == AppStatus.loading;
  }
}

extension ImageQualityExtension on ImageQuality {
  String get displayName {
    switch (this) {
      case ImageQuality.low:
        return 'Low (Fast)';
      case ImageQuality.medium:
        return 'Medium';
      case ImageQuality.high:
        return 'High';
      case ImageQuality.original:
        return 'Original (Slow)';
    }
  }

  int get compressionQuality {
    switch (this) {
      case ImageQuality.low:
        return 60;
      case ImageQuality.medium:
        return 80;
      case ImageQuality.high:
        return 90;
      case ImageQuality.original:
        return 100;
    }
  }

  int get maxWidth {
    switch (this) {
      case ImageQuality.low:
        return 1024;
      case ImageQuality.medium:
        return 1920;
      case ImageQuality.high:
        return 2560;
      case ImageQuality.original:
        return 4096;
    }
  }
}

extension NetworkTypeExtension on NetworkType {
  String get displayName {
    switch (this) {
      case NetworkType.devnet:
        return 'Devnet (Test)';
      case NetworkType.testnet:
        return 'Testnet';
      case NetworkType.mainnet:
        return 'Mainnet';
    }
  }

  String get rpcUrl {
    switch (this) {
      case NetworkType.devnet:
        return 'https://api.devnet.solana.com';
      case NetworkType.testnet:
        return 'https://api.testnet.solana.com';
      case NetworkType.mainnet:
        return 'https://api.mainnet-beta.solana.com';
    }
  }

  String get websocketUrl {
    switch (this) {
      case NetworkType.devnet:
        return 'wss://api.devnet.solana.com/';
      case NetworkType.testnet:
        return 'wss://api.testnet.solana.com/';
      case NetworkType.mainnet:
        return 'wss://api.mainnet-beta.solana.com/';
    }
  }

  String get irysUrl {
    switch (this) {
      case NetworkType.devnet:
        return 'https://devnet.irys.xyz';
      case NetworkType.testnet:
        return 'https://devnet.irys.xyz';
      case NetworkType.mainnet:
        return 'https://node1.irys.xyz';
    }
  }
}
