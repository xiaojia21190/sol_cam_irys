import 'package:flutter_test/flutter_test.dart';
import 'package:sol_cam_irys/services/solana_service.dart';
import 'package:sol_cam_irys/models/wallet_model.dart';

void main() {
  group('Wallet Connection Tests', () {
    test('SolanaService connectWallet method signature should not require WalletType', () {
      // This test verifies that the connectWallet method signature has been updated
      // to not require a WalletType parameter
      
      final service = SolanaServiceImpl();
      
      // This should compile without errors - if WalletType was still required,
      // this would cause a compilation error
      expect(() => service.connectWallet(), isA<Function>());
    });

    test('WalletModel.fromMWAResult should work without WalletType parameter', () {
      // Test that the factory constructor works without WalletType
      const authToken = 'test_auth_token';
      const publicKey = 'test_public_key';
      const walletUriBase = 'test_uri_base';
      
      final wallet = WalletModel.fromMWAResult(
        authToken: authToken,
        publicKey: publicKey,
        walletUriBase: walletUriBase,
      );
      
      expect(wallet.authToken, equals(authToken));
      expect(wallet.publicKey, equals(publicKey));
      expect(wallet.walletUriBase, equals(walletUriBase));
      expect(wallet.name, equals('Mobile Wallet'));
      expect(wallet.status, equals(WalletStatus.connected));
      expect(wallet.type, equals(WalletType.phantom)); // Generic placeholder
    });

    test('WalletModel should have correct default values', () {
      const authToken = 'test_auth_token';
      const publicKey = 'test_public_key';
      
      final wallet = WalletModel.fromMWAResult(
        authToken: authToken,
        publicKey: publicKey,
      );
      
      expect(wallet.solBalance, equals(0.0));
      expect(wallet.lastUpdated, isNotNull);
      expect(wallet.walletUriBase, isNull);
    });
  });
}
