class AppConstants {
  // App Information
  static const String appName = 'SolCam - NFT Camera';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Transform your camera into a Web3 device for instant NFT creation';

  // Solana 配置
  static const String solanaNetwork = 'devnet';
  static const String solanaRpcUrl = 'https://api.devnet.solana.com';
  static const String solanaWebsocketUrl = 'wss://api.devnet.solana.com';

  // 🔧 Irys 服务器配置
  // 服务器地址配置
  static const String _localIrysServer = 'http://localhost:3000';
  static const String _networkIrysServer = 'http://192.168.1.100:3000'; // 修改为您的局域网地址
  static const String _productionIrysServer = 'https://your-irys-server.com'; // 修改为您的生产服务器地址

  // 当前环境（开发时可以修改这个）
  static const AppEnvironment currentEnvironment = AppEnvironment.local;

  // 根据环境返回相应的服务器地址
  static String get irysServerUrl {
    switch (currentEnvironment) {
      case AppEnvironment.local:
        return _localIrysServer;
      case AppEnvironment.network:
        return _networkIrysServer;
      case AppEnvironment.production:
        return _productionIrysServer;
    }
  }

  // 存储配置
  static const String localStorageDir = 'nft_storage';

  // NFT 配置
  static const String defaultNFTSymbol = 'SLENS';
  static const int maxImageSize = 10 * 1024 * 1024; // 10MB
  static const List<String> supportedImageFormats = ['jpg', 'jpeg', 'png', 'gif', 'webp'];

  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 400);
  static const Duration longAnimationDuration = Duration(milliseconds: 600);
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double defaultBorderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  static const double largeBorderRadius = 16.0;

  // Camera Settings
  static const double defaultZoomLevel = 1.0;
  static const double maxZoomLevel = 8.0;
  static const double minZoomLevel = 1.0;
  static const double zoomStep = 0.1;

  // 服务器健康检查配置
  static const Duration serverCheckTimeout = Duration(seconds: 5);
  static const int serverRetryAttempts = 3;
}

enum AppEnvironment {
  local, // 本地开发环境 (localhost)
  network, // 局域网环境 (192.168.x.x)
  production, // 生产环境 (域名)
}

/// Irys 服务器状态
enum ServerStatus { unknown, checking, online, offline, error }

class ApiEndpoints {
  static const String baseUrl = 'https://api.solanelens.com';
  static const String uploadImage = '/upload/image';
  static const String uploadMetadata = '/upload/metadata';
  static const String mintNFT = '/nft/mint';
  static const String getUserNFTs = '/nft/user';
  static const String getWalletBalance = '/wallet/balance';
  static const String getTransactionStatus = '/transaction/status';
}

class HiveBoxes {
  static const String settings = 'settings';
  static const String wallets = 'wallets';
  static const String nfts = 'nfts';
  static const String photos = 'photos';
  static const String transactions = 'transactions';
}

class RouteNames {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String camera = '/camera';
  static const String gallery = '/gallery';
  static const String wallet = '/wallet';
  static const String settings = '/settings';
  static const String nftDetail = '/nft-detail';
  static const String photoEditor = '/photo-editor';
  static const String walletConnect = '/wallet-connect';
}
