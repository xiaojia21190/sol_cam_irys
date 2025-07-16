import 'dart:typed_data';
import 'dart:convert';
import 'package:solana/solana.dart';
import 'package:solana_mobile_client/solana_mobile_client.dart';
import '../models/wallet_model.dart';
import '../models/nft_model.dart';

abstract class SolanaService {
  Future<void> initialize(String rpcUrl, String websocketUrl);
  Future<WalletModel> connectWallet();
  Future<void> disconnectWallet();
  Future<double> getBalance(String publicKey);
  Future<String> mintNFT({required String metadataUri, required String name, required String symbol, required String walletAddress});
  Future<List<NFTModel>> getUserNFTs(String walletAddress);
  Future<String> transferSOL({required String fromAddress, required String toAddress, required double amount});
  Future<bool> confirmTransaction(String signature);

  // Mobile Wallet Adapter specific methods
  Future<bool> isWalletAdapterAvailable();
  Future<void> requestAirdrop({int lamports = 1000000000});
  Future<String> sendSOL({required String recipientAddress, required double amount});
  Future<double> getConnectedWalletBalance();
  String? getConnectedWalletAddress();
  bool get isWalletConnected;
  String? getAuthToken();
  Uint8List? getPublicKey();
}

class SolanaServiceImpl implements SolanaService {
  SolanaClient? _client;
  String? _authToken;
  Uint8List? _publicKey;

  // MWA Configuration
  static const String _appName = 'SolCam - NFT Camera';
  static const String _appUri = 'https://solcam.app';
  static const String _iconUri = 'favicon.ico';
  static const String _cluster = 'testnet'; // Use devnet for development

  @override
  Future<void> initialize(String rpcUrl, String websocketUrl) async {
    try {
      final rpcUri = Uri.parse(rpcUrl);
      final wsUri = Uri.parse(websocketUrl);

      _client = SolanaClient(rpcUrl: rpcUri, websocketUrl: wsUri);
    } catch (e) {
      throw SolanaException('Failed to initialize Solana client: $e');
    }
  }

  @override
  Future<bool> isWalletAdapterAvailable() async {
    try {
      return await LocalAssociationScenario.isAvailable();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<WalletModel> connectWallet() async {
    try {
      if (_client == null) {
        throw SolanaException('Solana client not initialized');
      }

      // Connect using Mobile Wallet Adapter - let MWA handle wallet selection
      return await _connectWithMWA();
    } catch (e) {
      throw SolanaException('Failed to connect wallet: $e');
    }
  }

  @override
  Future<void> disconnectWallet() async {
    try {
      // If we have an auth token, deauthorize the wallet
      if (_authToken != null) {
        final session = await LocalAssociationScenario.create();
        session.startActivityForResult(null).ignore();

        final client = await session.start();

        try {
          await client.deauthorize(authToken: _authToken!);
        } finally {
          await session.close();
        }
      }
    } catch (e) {
      // Log error but don't throw - we still want to clear local state
      print('Error deauthorizing wallet: $e');
    } finally {
      // Clear all wallet-related state
      _authToken = null;
      _publicKey = null;
    }
  }

  @override
  Future<double> getBalance(String publicKey) async {
    try {
      if (_client == null) {
        throw SolanaException('Solana client not initialized');
      }

      final balanceResult = await _client!.rpcClient.getBalance(publicKey);

      // Convert lamports to SOL
      return balanceResult.value / lamportsPerSol;
    } catch (e) {
      throw SolanaException('Failed to get balance: $e');
    }
  }

  // Token balance functionality removed - can be implemented when needed

  @override
  Future<String> mintNFT({required String metadataUri, required String name, required String symbol, required String walletAddress}) async {
    try {
      if (_client == null) {
        throw SolanaException('Solana client not initialized');
      }

      if (_authToken == null || _publicKey == null) {
        throw SolanaException('Wallet not connected');
      }

      // Create MWA session
      final session = await LocalAssociationScenario.create();
      session.startActivityForResult(null).ignore();
      final client = await session.start();

      try {
        // Reauthorize using stored auth token
        await client.reauthorize(authToken: _authToken!);

        // For now, create a simple memo transaction as a placeholder for NFT minting
        // In production, you would use Metaplex Token Metadata program

        // Create a memo instruction with NFT metadata
        final memoData = 'NFT_MINT:$name:$symbol:$metadataUri';

        // Create a simple transaction bytes representation
        // This is a simplified approach - in production you'd properly serialize the transaction
        final memoBytes = utf8.encode(memoData);
        final transactionBytes = Uint8List.fromList(memoBytes);

        // Sign and send transaction using MWA
        final result = await client.signAndSendTransactions(transactions: [transactionBytes]);

        if (result.signatures.isNotEmpty) {
          // Convert signature bytes to hex string for now
          final signatureBytes = result.signatures.first;
          final signature = signatureBytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
          return signature;
        } else {
          throw SolanaException('No signature returned from wallet');
        }
      } finally {
        await session.close();
      }
    } catch (e) {
      throw SolanaException('Failed to mint NFT: $e');
    }
  }

  @override
  Future<List<NFTModel>> getUserNFTs(String walletAddress) async {
    try {
      if (_client == null) {
        throw SolanaException('Solana client not initialized');
      }

      // This is a simplified implementation
      // In reality, you would query the user's NFTs from the blockchain
      return [];
    } catch (e) {
      throw SolanaException('Failed to get user NFTs: $e');
    }
  }

  @override
  Future<String> transferSOL({required String fromAddress, required String toAddress, required double amount}) async {
    try {
      if (_client == null) {
        throw SolanaException('Solana client not initialized');
      }

      // This is a simplified transfer implementation
      final signature = 'mock_transfer_${DateTime.now().millisecondsSinceEpoch}';

      // Simulate transfer delay
      await Future.delayed(const Duration(seconds: 2));

      return signature;
    } catch (e) {
      throw SolanaException('Failed to transfer SOL: $e');
    }
  }

  // Transaction details functionality removed - can be implemented when needed

  @override
  Future<bool> confirmTransaction(String signature) async {
    try {
      if (_client == null) {
        throw SolanaException('Solana client not initialized');
      }

      // Simulate confirmation delay
      await Future.delayed(const Duration(seconds: 1));

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Connects to a wallet using Mobile Wallet Adapter
  Future<WalletModel> _connectWithMWA() async {
    try {
      // Check if MWA is available first
      final isAvailable = await LocalAssociationScenario.isAvailable();
      if (!isAvailable) {
        throw SolanaException('Mobile Wallet Adapter is not available on this device');
      }

      // Create a Mobile Wallet Adapter session
      final session = await LocalAssociationScenario.create();
      session.startActivityForResult(null).ignore();

      final client = await session.start();

      try {
        // Authorize the wallet connection - MWA will handle wallet selection automatically
        final result = await client.authorize(identityUri: Uri.parse(_appUri), iconUri: Uri.parse(_iconUri), identityName: _appName, cluster: _cluster);

        if (result != null) {
          // Store the auth token and public key for future use
          _authToken = result.authToken;
          _publicKey = result.publicKey;

          // Create wallet model - MWA handles the actual wallet selection
          final walletModel = WalletModel.fromMWAResult(authToken: result.authToken, publicKey: Ed25519HDPublicKey(_publicKey!).toBase58(), walletUriBase: result.walletUriBase?.toString());

          return walletModel;
        } else {
          throw SolanaException('User declined wallet authorization');
        }
      } finally {
        // Always close the session
        await session.close();
      }
    } catch (e) {
      throw SolanaException('Failed to connect wallet with MWA: $e');
    }
  }

  /// Requests an airdrop for the connected wallet
  @override
  Future<void> requestAirdrop({int lamports = 1000000000}) async {
    if (_client == null) {
      throw SolanaException('Solana client not initialized');
    }

    if (_publicKey == null) {
      throw SolanaException('No wallet connected');
    }

    try {
      await _client!.requestAirdrop(address: Ed25519HDPublicKey(_publicKey!), lamports: lamports);
    } catch (e) {
      throw SolanaException('Failed to request airdrop: $e');
    }
  }

  /// Gets the balance of the currently connected wallet
  @override
  Future<double> getConnectedWalletBalance() async {
    if (_publicKey == null) {
      throw SolanaException('No wallet connected');
    }

    return getBalance(Ed25519HDPublicKey(_publicKey!).toBase58());
  }

  /// Gets the public key of the currently connected wallet
  @override
  String? getConnectedWalletAddress() {
    if (_publicKey == null) return null;
    return Ed25519HDPublicKey(_publicKey!).toBase58();
  }

  /// Checks if a wallet is currently connected
  @override
  bool get isWalletConnected => _publicKey != null && _authToken != null;

  /// Sends SOL tokens using Mobile Wallet Adapter
  @override
  Future<String> sendSOL({required String recipientAddress, required double amount}) async {
    if (_authToken == null || _publicKey == null) {
      throw SolanaException('Wallet not connected');
    }

    try {
      // Create MWA session
      final session = await LocalAssociationScenario.create();
      session.startActivityForResult(null).ignore();

      final client = await session.start();

      try {
        // Reauthorize using stored auth token
        await client.reauthorize(authToken: _authToken!);

        final fromPublicKey = Ed25519HDPublicKey(_publicKey!);
        final toPublicKey = Ed25519HDPublicKey.fromBase58(recipientAddress);
        final lamports = (amount * lamportsPerSol).toInt();

        // Create a simple transaction bytes representation
        // This is simplified - in production you'd properly serialize the transaction
        final transferData = 'TRANSFER:${fromPublicKey.toBase58()}:${toPublicKey.toBase58()}:$lamports';
        final transactionBytes = Uint8List.fromList(utf8.encode(transferData));

        // Sign and send transaction using MWA
        final result = await client.signAndSendTransactions(transactions: [transactionBytes]);

        if (result.signatures.isNotEmpty) {
          // Convert signature bytes to hex string
          final signatureBytes = result.signatures.first;
          final signature = signatureBytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
          return signature;
        } else {
          throw SolanaException('No signature returned from wallet');
        }
      } finally {
        await session.close();
      }
    } catch (e) {
      throw SolanaException('Failed to send SOL: $e');
    }
  }

  @override
  String? getAuthToken() {
    return _authToken;
  }

  @override
  Uint8List? getPublicKey() {
    return _publicKey;
  }
}

class SolanaException implements Exception {
  final String message;

  SolanaException(this.message);

  @override
  String toString() => 'SolanaException: $message';
}
