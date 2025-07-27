// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$solanaServiceHash() => r'bd8f8e84ae4216c8bfc1144ae925574055468558';

/// See also [solanaService].
@ProviderFor(solanaService)
final solanaServiceProvider = Provider<SolanaService>.internal(
  solanaService,
  name: r'solanaServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$solanaServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SolanaServiceRef = ProviderRef<SolanaService>;
String _$storageServiceHash() => r'060bd28c77c02edbd973e6092306cab645c30581';

/// See also [storageService].
@ProviderFor(storageService)
final storageServiceProvider = Provider<StorageService>.internal(
  storageService,
  name: r'storageServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$storageServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StorageServiceRef = ProviderRef<StorageService>;
String _$cameraServiceHash() => r'cc4834f8605d3b9c7220b497a37e8b43b9586fbe';

/// See also [cameraService].
@ProviderFor(cameraService)
final cameraServiceProvider = AutoDisposeProvider<CameraService>.internal(
  cameraService,
  name: r'cameraServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cameraServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CameraServiceRef = AutoDisposeProviderRef<CameraService>;
String _$isWalletConnectedHash() => r'cb0334d8a5316626d0a3956c1d2f0e4ade5edb50';

/// See also [isWalletConnected].
@ProviderFor(isWalletConnected)
final isWalletConnectedProvider = AutoDisposeProvider<bool>.internal(
  isWalletConnected,
  name: r'isWalletConnectedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isWalletConnectedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsWalletConnectedRef = AutoDisposeProviderRef<bool>;
String _$walletBalanceHash() => r'91ad081672e740ef44260d72279fff252394c523';

/// See also [walletBalance].
@ProviderFor(walletBalance)
final walletBalanceProvider = AutoDisposeProvider<double>.internal(
  walletBalance,
  name: r'walletBalanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$walletBalanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WalletBalanceRef = AutoDisposeProviderRef<double>;
String _$completedNFTsHash() => r'eee836ca5f8c874a18c439d85ebbec8df9017932';

/// See also [completedNFTs].
@ProviderFor(completedNFTs)
final completedNFTsProvider = AutoDisposeProvider<List<NFTModel>>.internal(
  completedNFTs,
  name: r'completedNFTsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$completedNFTsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CompletedNFTsRef = AutoDisposeProviderRef<List<NFTModel>>;
String _$pendingNFTsHash() => r'6d99964cf57f532a6dbe32b96296ae00656ae196';

/// See also [pendingNFTs].
@ProviderFor(pendingNFTs)
final pendingNFTsProvider = AutoDisposeProvider<List<NFTModel>>.internal(
  pendingNFTs,
  name: r'pendingNFTsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingNFTsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PendingNFTsRef = AutoDisposeProviderRef<List<NFTModel>>;
String _$processedPhotosHash() => r'a5e9f7054313eed3b373c4ac7aca08ad5c9d4262';

/// See also [processedPhotos].
@ProviderFor(processedPhotos)
final processedPhotosProvider = AutoDisposeProvider<List<PhotoModel>>.internal(
  processedPhotos,
  name: r'processedPhotosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$processedPhotosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProcessedPhotosRef = AutoDisposeProviderRef<List<PhotoModel>>;
String _$appStateHash() => r'8d92b095c8c4e2421b3d39c6df402b64445bfffa';

/// See also [AppState].
@ProviderFor(AppState)
final appStateProvider = NotifierProvider<AppState, AppStateModel>.internal(
  AppState.new,
  name: r'appStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppState = Notifier<AppStateModel>;
String _$walletActionsHash() => r'8a0ac4abbb3b071cbae815bc5df011c2c8c3ba3c';

/// See also [WalletActions].
@ProviderFor(WalletActions)
final walletActionsProvider =
    AutoDisposeNotifierProvider<WalletActions, void>.internal(
      WalletActions.new,
      name: r'walletActionsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$walletActionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WalletActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
