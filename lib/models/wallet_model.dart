import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
abstract class WalletModel with _$WalletModel {
  const factory WalletModel({
    required String publicKey,
    required String name,
    required WalletType type,
    required WalletStatus status,
    @Default(0.0) double solBalance,
    DateTime? lastUpdated,
    // Native MWA data - stored for reference but not used directly
    String? authToken,
    String? walletUriBase,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);

  // Factory constructor from MWA AuthorizationResult
  factory WalletModel.fromMWAResult({required String authToken, required String publicKey, String? walletUriBase}) {
    // Use a generic wallet type since MWA handles the actual wallet selection
    const type = WalletType.phantom; // Generic placeholder - actual wallet is determined by MWA
    return WalletModel(publicKey: publicKey, name: 'Mobile Wallet', type: type, status: WalletStatus.connected, authToken: authToken, walletUriBase: walletUriBase, lastUpdated: DateTime.now());
  }
}

// Simplified models - removed TokenBalance and TransactionModel
// These can be handled by the Solana service directly when needed

enum WalletType { phantom, solflare, backpack, glow, imported, generated }

enum WalletStatus { disconnected, connecting, connected, error }

// TransactionStatus enum removed - not needed for simplified wallet model

extension WalletTypeExtension on WalletType {
  String get displayName {
    switch (this) {
      case WalletType.phantom:
        return 'Phantom';
      case WalletType.solflare:
        return 'Solflare';
      case WalletType.backpack:
        return 'Backpack';
      case WalletType.glow:
        return 'Glow';
      case WalletType.imported:
        return 'Imported Wallet';
      case WalletType.generated:
        return 'Generated Wallet';
    }
  }

  String get iconPath {
    switch (this) {
      case WalletType.phantom:
        return 'assets/icons/phantom.png';
      case WalletType.solflare:
        return 'assets/icons/solflare.png';
      case WalletType.backpack:
        return 'assets/icons/backpack.png';
      case WalletType.glow:
        return 'assets/icons/glow.png';
      case WalletType.imported:
        return 'assets/icons/wallet.png';
      case WalletType.generated:
        return 'assets/icons/wallet.png';
    }
  }

  bool get isExternal {
    return this == WalletType.phantom || this == WalletType.solflare || this == WalletType.backpack || this == WalletType.glow;
  }
}

extension WalletStatusExtension on WalletStatus {
  String get displayName {
    switch (this) {
      case WalletStatus.disconnected:
        return 'Disconnected';
      case WalletStatus.connecting:
        return 'Connecting...';
      case WalletStatus.connected:
        return 'Connected';
      case WalletStatus.error:
        return 'Error';
    }
  }

  bool get isConnected {
    return this == WalletStatus.connected;
  }

  bool get isLoading {
    return this == WalletStatus.connecting;
  }
}

// TransactionStatusExtension removed - not needed for simplified wallet model
