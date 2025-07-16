// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mint_process_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isMintingInProgressHash() =>
    r'0b9615599b0a28b3a52c0c51b3955b5ef4b8a78b';

/// 便捷的状态访问器
///
/// Copied from [isMintingInProgress].
@ProviderFor(isMintingInProgress)
final isMintingInProgressProvider = AutoDisposeProvider<bool>.internal(
  isMintingInProgress,
  name: r'isMintingInProgressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isMintingInProgressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsMintingInProgressRef = AutoDisposeProviderRef<bool>;
String _$mintingProgressHash() => r'6ede926d38c5ed41a435f3d02d9288d484e55b12';

/// See also [mintingProgress].
@ProviderFor(mintingProgress)
final mintingProgressProvider = AutoDisposeProvider<double>.internal(
  mintingProgress,
  name: r'mintingProgressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mintingProgressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MintingProgressRef = AutoDisposeProviderRef<double>;
String _$mintingMessageHash() => r'620aab848aacc455c0f15df6c529fd482c0aaff7';

/// See also [mintingMessage].
@ProviderFor(mintingMessage)
final mintingMessageProvider = AutoDisposeProvider<String?>.internal(
  mintingMessage,
  name: r'mintingMessageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mintingMessageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MintingMessageRef = AutoDisposeProviderRef<String?>;
String _$mintProcessHash() => r'a76445ffb31b858f272d16137b0dfcfdf9f75cb6';

/// NFT 铸造流程管理器
///
/// Copied from [MintProcess].
@ProviderFor(MintProcess)
final mintProcessProvider =
    AutoDisposeNotifierProvider<MintProcess, MintProcessState>.internal(
      MintProcess.new,
      name: r'mintProcessProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$mintProcessHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MintProcess = AutoDisposeNotifier<MintProcessState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
