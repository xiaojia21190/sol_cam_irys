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

  // 会话管理和调试方法
  Map<String, dynamic> getSessionStatus();
  Future<bool> performHealthCheck();
}

class SolanaServiceImpl implements SolanaService {
  SolanaClient? _client;
  String? _authToken;
  Uint8List? _publicKey;

  // MWA Session Management
  LocalAssociationScenario? _mwaSession;
  MobileWalletAdapterClient? _mwaClient;
  bool _isSessionActive = false;

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

  /// 确保MWA会话处于活跃状态
  Future<MobileWalletAdapterClient> _ensureSessionActive() async {
    if (_mwaSession == null || _mwaClient == null || !_isSessionActive) {
      print('🔄 创建新的MWA会话...');
      await _createMWASession();
    }

    if (_mwaClient == null) {
      throw SolanaException('Failed to create MWA session');
    }

    return _mwaClient!;
  }

  /// 智能检查并处理授权状态
  Future<void> _ensureAuthorized(MobileWalletAdapterClient client) async {
    if (_authToken == null) {
      throw SolanaException('No auth token available. Please reconnect wallet.');
    }

    try {
      print('🔄 检查授权状态...');
      await client.reauthorize(authToken: _authToken!);
      print('✅ 授权状态有效');
    } catch (e) {
      print('⚠️ 重新授权失败: $e');
      // 清理过期的授权信息
      _authToken = null;
      _publicKey = null;
      throw SolanaException('Authorization expired. Please reconnect wallet.');
    }
  }

  /// 创建MWA会话
  Future<void> _createMWASession() async {
    try {
      // 清理旧会话
      await _closeMWASession();

      print('📱 创建新的MWA会话...');
      _mwaSession = await LocalAssociationScenario.create();
      _mwaSession!.startActivityForResult(null).ignore();

      print('🔗 启动MWA客户端...');
      _mwaClient = await _mwaSession!.start();
      _isSessionActive = true;

      print('✅ MWA会话创建成功');
    } catch (e) {
      print('❌ MWA会话创建失败: $e');
      await _closeMWASession();
      throw SolanaException('Failed to create MWA session: $e');
    }
  }

  /// 关闭MWA会话
  Future<void> _closeMWASession() async {
    try {
      if (_mwaSession != null) {
        print('🔒 关闭MWA会话...');
        await _mwaSession!.close();
      }
    } catch (e) {
      print('⚠️ 关闭MWA会话时出错: $e');
    } finally {
      _mwaSession = null;
      _mwaClient = null;
      _isSessionActive = false;
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

      // 详细的钱包可用性检查
      final isAvailable = await _checkWalletAvailabilityDetailed();
      if (!isAvailable) {
        throw SolanaException('Mobile Wallet Adapter is not available. Please install a compatible Solana wallet.');
      }

      // Connect using Mobile Wallet Adapter - let MWA handle wallet selection
      return await _connectWithMWA();
    } catch (e) {
      throw SolanaException('Failed to connect wallet: $e');
    }
  }

  /// 详细检查钱包可用性
  Future<bool> _checkWalletAvailabilityDetailed() async {
    try {
      print('🔍 开始检查钱包可用性...');

      // 检查 MWA 基础可用性
      final isMWAAvailable = await LocalAssociationScenario.isAvailable();
      print('📱 MWA 基础可用性: $isMWAAvailable');

      if (!isMWAAvailable) {
        print('❌ Mobile Wallet Adapter 不可用');
        print('💡 建议: 确保您的设备支持 Android 7.0+ 且安装了钱包应用');
        return false;
      }

      print('✅ 钱包适配器可用');
      return true;
    } catch (e) {
      print('❌ 钱包可用性检查失败: $e');
      return false;
    }
  }

  @override
  Future<void> disconnectWallet() async {
    try {
      // If we have an auth token and active session, deauthorize the wallet
      if (_authToken != null && _isSessionActive && _mwaClient != null) {
        print('🔓 正在断开钱包连接...');
        try {
          await _mwaClient!.deauthorize(authToken: _authToken!);
          print('✅ 钱包已成功断开连接');
        } catch (e) {
          print('⚠️ 断开连接时出错: $e');
        }
      }
    } catch (e) {
      // Log error but don't throw - we still want to clear local state
      print('Error deauthorizing wallet: $e');
    } finally {
      // Clear all wallet-related state and close session
      _authToken = null;
      _publicKey = null;
      await _closeMWASession();
      print('🧹 钱包状态已清理');
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

      print('🎨 开始 NFT Mint 流程...');
      print('📝 名称: $name, 符号: $symbol');
      print('🔗 元数据URI: $metadataUri');

      // 使用现有的MWA会话
      final client = await _ensureSessionActive();

      try {
        // 确保授权状态有效
        await _ensureAuthorized(client);

        // 创建一个简化的memo事务作为NFT mint的占位符
        // 在生产环境中，这里应该使用Metaplex Token Metadata程序
        final memoData = 'NFT_MINT:$name:$symbol:$metadataUri';
        final transactionBytes = _createMemoTransactionBytes(memoData);

        print('📤 发送NFT mint事务...');
        // 使用MWA签名并发送事务
        final result = await client.signAndSendTransactions(transactions: [transactionBytes]);

        if (result.signatures.isNotEmpty) {
          // 转换签名为十六进制字符串
          final signatureBytes = result.signatures.first;
          final signature = signatureBytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

          print('✅ NFT mint 事务已发送');
          print('🔑 签名: ${signature.substring(0, 20)}...');

          return signature;
        } else {
          throw SolanaException('No signature returned from wallet');
        }
      } catch (e) {
        print('❌ NFT mint 失败: $e');
        throw SolanaException('Failed to mint NFT: $e');
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
      print('🚀 开始 MWA 连接流程...');

      // 确保MWA会话处于活跃状态
      final client = await _ensureSessionActive();

      print('🔐 请求钱包授权...');
      print('📱 应用信息: $_appName');
      print('🌐 网络: $_cluster');

      // Authorize the wallet connection - MWA will handle wallet selection automatically
      final result = await client.authorize(identityUri: Uri.parse(_appUri), iconUri: Uri.parse(_iconUri), identityName: _appName, cluster: _cluster);

      if (result != null) {
        print('✅ 钱包授权成功！');
        print('🔑 Auth Token: ${result.authToken.substring(0, 10)}...');
        print('🏛️ Public Key: ${Ed25519HDPublicKey(result.publicKey).toBase58().substring(0, 10)}...');

        // Store the auth token and public key for future use
        _authToken = result.authToken;
        _publicKey = result.publicKey;

        // Create wallet model - MWA handles the actual wallet selection
        final walletModel = WalletModel.fromMWAResult(authToken: result.authToken, publicKey: Ed25519HDPublicKey(_publicKey!).toBase58(), walletUriBase: result.walletUriBase?.toString());

        print('🎉 钱包连接完成！会话保持活跃状态');
        return walletModel;
      } else {
        print('❌ 用户取消了钱包授权');
        throw SolanaException('User declined wallet authorization');
      }
    } catch (e) {
      print('❌ MWA 连接失败: $e');

      // 连接失败时清理会话
      await _closeMWASession();

      // 提供具体的错误诊断和解决方案
      final errorMessage = _categorizeWalletError(e.toString());
      throw SolanaException(errorMessage);
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
  bool get isWalletConnected => _publicKey != null && _authToken != null && _isSessionActive;

  /// 获取当前会话状态信息（用于调试）
  @override
  Map<String, dynamic> getSessionStatus() {
    return {
      'hasAuthToken': _authToken != null,
      'hasPublicKey': _publicKey != null,
      'isSessionActive': _isSessionActive,
      'hasClient': _mwaClient != null,
      'hasSession': _mwaSession != null,
      'walletAddress': _publicKey != null ? '${Ed25519HDPublicKey(_publicKey!).toBase58().substring(0, 10)}...' : null,
    };
  }

  /// 执行会话健康检查
  @override
  Future<bool> performHealthCheck() async {
    try {
      print('🔍 执行会话健康检查...');

      // 检查基本状态
      final status = getSessionStatus();
      print('📊 会话状态: $status');

      if (!_isSessionActive || _mwaClient == null || _authToken == null) {
        print('⚠️ 会话状态异常，需要重新连接');
        return false;
      }

      // 尝试重新授权以验证会话有效性
      try {
        await _mwaClient!.reauthorize(authToken: _authToken!);
        print('✅ 会话健康检查通过');
        return true;
      } catch (e) {
        print('❌ 授权验证失败: $e');
        // 清理无效状态
        _authToken = null;
        _publicKey = null;
        await _closeMWASession();
        return false;
      }
    } catch (e) {
      print('❌ 健康检查异常: $e');
      return false;
    }
  }

  /// Sends SOL tokens using Mobile Wallet Adapter
  @override
  Future<String> sendSOL({required String recipientAddress, required double amount}) async {
    if (_authToken == null || _publicKey == null) {
      throw SolanaException('Wallet not connected');
    }

    try {
      print('💰 开始 SOL 转账流程...');
      print('📤 转账金额: $amount SOL');
      print('📍 接收地址: ${recipientAddress.substring(0, 10)}...');

      // 使用现有的MWA会话
      final client = await _ensureSessionActive();

      try {
        // 确保授权状态有效
        await _ensureAuthorized(client);

        final fromPublicKey = Ed25519HDPublicKey(_publicKey!);
        final toPublicKey = Ed25519HDPublicKey.fromBase58(recipientAddress);
        final lamports = (amount * lamportsPerSol).toInt();

        // 创建简化的转账事务字节表示
        final transactionBytes = _createTransferTransactionBytes(fromPublicKey.toBase58(), toPublicKey.toBase58(), lamports);

        print('📤 发送转账事务...');
        // 使用MWA签名并发送事务
        final result = await client.signAndSendTransactions(transactions: [transactionBytes]);

        if (result.signatures.isNotEmpty) {
          // 转换签名为十六进制字符串
          final signatureBytes = result.signatures.first;
          final signature = signatureBytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

          print('✅ SOL 转账事务已发送');
          print('🔑 签名: ${signature.substring(0, 20)}...');

          return signature;
        } else {
          throw SolanaException('No signature returned from wallet');
        }
      } catch (e) {
        print('❌ SOL 转账失败: $e');
        throw SolanaException('Failed to send SOL: $e');
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

  /// 创建简化的memo事务字节
  Uint8List _createMemoTransactionBytes(String memoData) {
    // 注意：这是简化版本，实际生产环境应该使用正确的Solana事务格式
    // 包括正确的指令、账户、签名等结构
    final memoBytes = utf8.encode(memoData);
    return Uint8List.fromList(memoBytes);
  }

  /// 创建简化的转账事务字节
  Uint8List _createTransferTransactionBytes(String fromAddress, String toAddress, int lamports) {
    // 注意：这是简化版本，实际生产环境应该使用SystemProgram.transfer
    final transferData = 'TRANSFER:$fromAddress:$toAddress:$lamports';
    final transferBytes = utf8.encode(transferData);
    return Uint8List.fromList(transferBytes);
  }

  /// 分类钱包错误并提供具体的解决方案
  String _categorizeWalletError(String errorString) {
    if (errorString.contains('ActivityNotFoundException') || errorString.contains('No Activity found to handle Intent')) {
      return '❌ 未找到钱包应用\n\n🔧 解决方案:\n'
          '1. 从 Play Store 安装 Phantom、Solflare 或 Backpack 钱包\n'
          '2. 确保钱包应用已更新到最新版本\n'
          '3. 重启应用后重试';
    } else if (errorString.contains('SecurityException')) {
      return '❌ 权限错误\n\n🔧 解决方案:\n'
          '1. 检查应用权限设置\n'
          '2. 确保网络访问已允许\n'
          '3. 重新安装应用';
    } else if (errorString.contains('TimeoutException')) {
      return '❌ 连接超时\n\n🔧 解决方案:\n'
          '1. 检查网络连接\n'
          '2. 尝试切换网络\n'
          '3. 重启应用后重试';
    } else if (errorString.contains('User declined') || errorString.contains('User cancelled')) {
      return '❌ 用户取消了钱包连接\n\n💡 提示: 请在钱包应用中点击"连接"以继续';
    } else if (errorString.contains('Authorization expired')) {
      return '❌ 授权已过期\n\n🔧 解决方案: 请重新连接钱包';
    } else {
      return '❌ 连接失败: ${errorString.replaceAll('SolanaException: ', '')}\n\n'
          '🔧 建议:\n'
          '1. 确保已安装钱包应用\n'
          '2. 检查网络连接\n'
          '3. 重启应用后重试';
    }
  }
}

class SolanaException implements Exception {
  final String message;

  SolanaException(this.message);

  @override
  String toString() => 'SolanaException: $message';
}
