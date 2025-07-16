class AppConstants {
  // App Information
  static const String appName = 'Solana Lens';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Transform your camera into a Web3 device for instant NFT creation';

  // Network URLs
  static const String devnetRpcUrl = 'https://api.devnet.solana.com';
  static const String devnetWebsocketUrl = 'wss://api.devnet.solana.com/';
  static const String testnetRpcUrl = 'https://api.testnet.solana.com';
  static const String testnetWebsocketUrl = 'wss://api.testnet.solana.com/';
  static const String mainnetRpcUrl = 'https://api.mainnet-beta.solana.com';
  static const String mainnetWebsocketUrl = 'wss://api.mainnet-beta.solana.com/';

  // Irys URLs
  static const String devnetIrysUrl = 'https://devnet.irys.xyz';
  static const String mainnetIrysUrl = 'https://node1.irys.xyz';
  static const String irysGatewayUrl = 'https://gateway.irys.xyz';

  // Storage Keys
  static const String walletStorageKey = 'wallet_data';
  static const String settingsStorageKey = 'app_settings';
  static const String nftsStorageKey = 'user_nfts';
  static const String photosStorageKey = 'captured_photos';

  // File Paths
  static const String photosDirectory = 'solana_lens_photos';
  static const String tempDirectory = 'temp';
  static const String cacheDirectory = 'cache';

  // Image Settings
  static const int maxImageWidth = 4096;
  static const int maxImageHeight = 4096;
  static const int defaultImageQuality = 90;
  static const int maxFileSizeBytes = 10 * 1024 * 1024; // 10MB

  // NFT Settings
  static const String defaultNFTSymbol = 'LENS';
  static const int defaultNFTSellerFeeBasisPoints = 500; // 5%
  static const String defaultNFTCollection = 'Solana Lens Collection';

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

  // Timeouts
  static const Duration networkTimeout = Duration(seconds: 30);
  static const Duration uploadTimeout = Duration(minutes: 5);
  static const Duration transactionTimeout = Duration(minutes: 2);

  // Error Messages
  static const String cameraPermissionDenied = 'Camera permission is required to take photos';
  static const String storagePermissionDenied = 'Storage permission is required to save photos';
  static const String locationPermissionDenied = 'Location permission is required for geotagging';
  static const String networkError = 'Network connection error. Please check your internet connection.';
  static const String walletConnectionError = 'Failed to connect to wallet. Please try again.';
  static const String uploadError = 'Failed to upload image. Please try again.';
  static const String mintingError = 'Failed to mint NFT. Please try again.';

  // Success Messages
  static const String photoSaved = 'Photo saved successfully';
  static const String nftMinted = 'NFT minted successfully';
  static const String walletConnected = 'Wallet connected successfully';

  // Watermark Settings
  static const String watermarkText = 'Solana Lens';
  static const double watermarkOpacity = 0.7;
  static const double watermarkFontSize = 16.0;

  // Social Sharing
  static const String shareText = 'Check out my NFT created with Solana Lens!';
  static const String appStoreUrl = 'https://apps.apple.com/app/solana-lens';
  static const String playStoreUrl = 'https://play.google.com/store/apps/details?id=com.solanelens.app';

  // External Links
  static const String websiteUrl = 'https://solanelens.com';
  static const String supportUrl = 'https://solanelens.com/support';
  static const String privacyPolicyUrl = 'https://solanelens.com/privacy';
  static const String termsOfServiceUrl = 'https://solanelens.com/terms';

  // Feature Flags
  static const bool enableAnalytics = false;
  static const bool enableCrashReporting = false;
  static const bool enableBetaFeatures = false;
  static const bool enableOfflineMode = true;

  // Limits
  static const int maxPhotosPerDay = 100;
  static const int maxNFTsPerWallet = 1000;
  static const int maxRetryAttempts = 3;

  // Pricing (in SOL)
  static const double estimatedMintingCost = 0.01;
  static const double estimatedStorageCost = 0.001;
  static const double minimumWalletBalance = 0.02;
}

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
