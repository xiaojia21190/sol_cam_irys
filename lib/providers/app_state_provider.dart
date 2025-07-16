import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solana/solana.dart';
import '../models/app_state_model.dart';
import '../models/wallet_model.dart';
import '../models/nft_model.dart';
import '../models/photo_model.dart';
import '../services/solana_service.dart';
import '../services/storage_service.dart';
import '../services/camera_service.dart';

part 'app_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AppState extends _$AppState {
  @override
  AppStateModel build() {
    return const AppStateModel();
  }

  void setStatus(AppStatus status) {
    state = state.copyWith(status: status);
  }

  void setError(String? errorMessage) {
    state = state.copyWith(status: errorMessage != null ? AppStatus.error : AppStatus.ready, errorMessage: errorMessage);
  }

  void setOnlineStatus(bool isOnline) {
    state = state.copyWith(isOnline: isOnline);
  }

  void setPermissions(bool hasPermissions) {
    state = state.copyWith(hasPermissions: hasPermissions);
  }

  void setConnectedWallet(WalletModel? wallet) {
    state = state.copyWith(connectedWallet: wallet);
  }

  void addNFT(NFTModel nft) {
    final updatedNFTs = [...state.userNFTs, nft];
    state = state.copyWith(userNFTs: updatedNFTs);
  }

  void updateNFT(NFTModel updatedNFT) {
    final updatedNFTs = state.userNFTs.map((nft) {
      return nft.id == updatedNFT.id ? updatedNFT : nft;
    }).toList();
    state = state.copyWith(userNFTs: updatedNFTs);
  }

  void removeNFT(String nftId) {
    final updatedNFTs = state.userNFTs.where((nft) => nft.id != nftId).toList();
    state = state.copyWith(userNFTs: updatedNFTs);
  }

  void addPhoto(PhotoModel photo) {
    final updatedPhotos = [...state.capturedPhotos, photo];
    state = state.copyWith(capturedPhotos: updatedPhotos);
  }

  void updatePhoto(PhotoModel updatedPhoto) {
    final updatedPhotos = state.capturedPhotos.map((photo) {
      return photo.id == updatedPhoto.id ? updatedPhoto : photo;
    }).toList();
    state = state.copyWith(capturedPhotos: updatedPhotos);
  }

  void removePhoto(String photoId) {
    final updatedPhotos = state.capturedPhotos.where((photo) => photo.id != photoId).toList();
    state = state.copyWith(capturedPhotos: updatedPhotos);
  }

  void updateSettings(AppSettings settings) {
    state = state.copyWith(settings: settings);
  }

  Future<void> initialize() async {
    try {
      debugPrint('begin ${state.status}');
      setStatus(AppStatus.initializing);

      // Initialize services
      await _initializeServices();

      // Load saved data
      await _loadSavedData();

      setStatus(AppStatus.ready);

      debugPrint('end ${state.status}');
    } catch (e) {
      setError('Failed to initialize app: $e');
    }
  }

  Future<void> _initializeServices() async {
    try {
      final solanaService = ref.read(solanaServiceProvider);
      final settings = state.settings;

      debugPrint('Initializing Solana service with RPC: ${settings.network.rpcUrl}');
      await solanaService.initialize(settings.network.rpcUrl, settings.network.websocketUrl);
      debugPrint('Solana service initialized successfully');
    } catch (e) {
      debugPrint('Failed to initialize Solana service: $e');
      throw Exception('Failed to initialize Solana service: $e');
    }
  }

  Future<void> _loadSavedData() async {
    // Load saved NFTs, photos, settings, etc.
    // This would typically load from local storage (Hive)
  }
}

// Service providers
@Riverpod(keepAlive: true)
SolanaService solanaService(Ref ref) {
  return SolanaServiceImpl();
}

@Riverpod(keepAlive: true)
StorageService storageService(Ref ref) {
  final settings = ref.watch(appStateProvider.select((state) => state.settings));

  // 创建一个临时的 SolanaClient 用于 IrysStorageService
  final solanaClient = SolanaClient(rpcUrl: Uri.parse(settings.network.rpcUrl), websocketUrl: Uri.parse(settings.network.websocketUrl));

  return IrysStorageService(
    nodeUrl: settings.network.irysUrl,
    solanaClient: solanaClient,
    authToken: null, // 将在运行时设置
    publicKey: null, // 将在运行时设置
  );
}

@riverpod
CameraService cameraService(Ref ref) {
  return CameraServiceImpl();
}

// Computed providers
@riverpod
bool isWalletConnected(Ref ref) {
  final wallet = ref.watch(appStateProvider.select((state) => state.connectedWallet));
  return wallet?.status.isConnected ?? false;
}

@riverpod
double walletBalance(Ref ref) {
  final wallet = ref.watch(appStateProvider.select((state) => state.connectedWallet));
  return wallet?.solBalance ?? 0.0;
}

@riverpod
List<NFTModel> completedNFTs(Ref ref) {
  final nfts = ref.watch(appStateProvider.select((state) => state.userNFTs));
  return nfts.where((nft) => nft.status.isCompleted).toList();
}

@riverpod
List<NFTModel> pendingNFTs(Ref ref) {
  final nfts = ref.watch(appStateProvider.select((state) => state.userNFTs));
  return nfts.where((nft) => nft.status.isLoading).toList();
}

@riverpod
List<PhotoModel> processedPhotos(Ref ref) {
  final photos = ref.watch(appStateProvider.select((state) => state.capturedPhotos));
  return photos.where((photo) => photo.status == PhotoStatus.processed).toList();
}

// Action providers
@riverpod
class WalletActions extends _$WalletActions {
  @override
  void build() {}

  Future<void> connectWallet() async {
    try {
      final appState = ref.read(appStateProvider.notifier);
      final solanaService = ref.read(solanaServiceProvider);
      final storageService = ref.read(storageServiceProvider);

      appState.setStatus(AppStatus.loading);

      // Check if Mobile Wallet Adapter is available
      final isWalletAdapterAvailable = await solanaService.isWalletAdapterAvailable();
      if (!isWalletAdapterAvailable) {
        throw Exception('Mobile Wallet Adapter is not available. Please install a compatible Solana wallet.');
      }

      final wallet = await solanaService.connectWallet();
      appState.setConnectedWallet(wallet);

      // Update storage service with wallet credentials
      final authToken = solanaService.getAuthToken();
      final publicKey = solanaService.getPublicKey();
      storageService.updateWalletCredentials(authToken, publicKey);

      appState.setStatus(AppStatus.ready);
    } catch (e) {
      String errorMessage;

      // Check for specific wallet-related errors
      if (e.toString().contains('ActivityNotFoundException') || e.toString().contains('No Activity found to handle Intent') || e.toString().contains('solana-wallet://') || e.toString().contains('Mobile Wallet Adapter is not available')) {
        errorMessage = 'No Solana wallet app found. Please install a compatible wallet like Phantom, Solflare, or Backpack from the Play Store.';
      } else if (e.toString().contains('User declined authorization') || e.toString().contains('User declined wallet authorization')) {
        errorMessage = 'Wallet connection was cancelled by user.';
      } else if (e.toString().contains('Solana client not initialized')) {
        errorMessage = 'App is still initializing. Please wait a moment and try again.';
      } else {
        errorMessage = 'Failed to connect wallet: ${e.toString().replaceAll('SolanaException: ', '').replaceAll('Failed to connect wallet: ', '')}';
      }

      ref.read(appStateProvider.notifier).setError(errorMessage);
    }
  }

  Future<void> disconnectWallet() async {
    try {
      final appState = ref.read(appStateProvider.notifier);
      final solanaService = ref.read(solanaServiceProvider);
      final storageService = ref.read(storageServiceProvider);

      await solanaService.disconnectWallet();
      appState.setConnectedWallet(null);

      // Clear storage service credentials
      storageService.updateWalletCredentials(null, null);
    } catch (e) {
      ref.read(appStateProvider.notifier).setError('Failed to disconnect wallet: $e');
    }
  }

  Future<void> refreshBalance() async {
    try {
      final wallet = ref.read(appStateProvider).connectedWallet;
      if (wallet == null) return;

      final solanaService = ref.read(solanaServiceProvider);
      final balance = await solanaService.getBalance(wallet.publicKey);

      final updatedWallet = wallet.copyWith(solBalance: balance, lastUpdated: DateTime.now());

      ref.read(appStateProvider.notifier).setConnectedWallet(updatedWallet);
    } catch (e) {
      ref.read(appStateProvider.notifier).setError('Failed to refresh balance: $e');
    }
  }
}
