import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../providers/app_state_provider.dart';
import '../../models/app_state_model.dart';
import '../../shared/widgets/modern_button.dart';
import '../../shared/widgets/modern_card.dart';
import '../../shared/widgets/modern_loading.dart';

import '../camera/camera_screen.dart';
import '../camera/photo_editor_screen.dart';
import '../nft/mint_nft_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final isWalletConnected = ref.watch(isWalletConnectedProvider);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              // 自定义AppBar
              _buildCustomAppBar(context, ref, isWalletConnected),

              // 主要内容
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppConstants.defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // 状态卡片
                      _buildStatusCard(context, appState),

                      const SizedBox(height: 24),

                      // 主要操作按钮
                      _buildMainActionButton(context, ref, appState, isWalletConnected),

                      const SizedBox(height: 16),

                      // 次要操作按钮
                      _buildSecondaryActions(context),

                      // 统计信息
                      Expanded(child: _buildStatsSection(context, appState, ref)),
                      // _buildStatsSection(context, appState, ref),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context, WidgetRef ref, bool isWalletConnected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          // Logo
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 24),
          ),

          const SizedBox(width: 12),

          // 标题
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppConstants.appName, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                Text('Capture & Mint NFTs', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600])),
              ],
            ),
          ),

          // 钱包按钮
          _buildWalletButton(context, ref, isWalletConnected),
        ],
      ),
    );
  }

  Widget _buildWalletButton(BuildContext context, WidgetRef ref, bool isWalletConnected) {
    return Container(
      decoration: BoxDecoration(
        color: isWalletConnected ? Colors.green.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isWalletConnected ? Colors.green : Colors.grey, width: 1),
      ),
      child: IconButton(
        icon: Icon(isWalletConnected ? Icons.account_balance_wallet : Icons.wallet, color: isWalletConnected ? Colors.green : Colors.grey[600]),
        onPressed: () => _showWalletDialog(context, ref),
      ),
    );
  }

  Widget _buildStatusCard(BuildContext context, AppStateModel appState) {
    return StatusCard(title: _getStatusText(appState.status), subtitle: appState.errorMessage ?? 'System running smoothly', icon: _getStatusIcon(appState.status), iconColor: _getStatusColor(appState.status));
  }

  Widget _buildMainActionButton(BuildContext context, WidgetRef ref, AppStateModel appState, bool isWalletConnected) {
    final canTakePhoto = _canTakePhoto(appState.status, isWalletConnected);

    return ModernButton.primary(
      text: _getActionButtonText(appState.status, isWalletConnected),
      icon: Icons.camera_alt_rounded,
      size: ModernButtonSize.large,
      isFullWidth: true,
      onPressed: canTakePhoto ? () => _openCamera(context, ref) : () => _showActionRequirement(context, ref, appState.status, isWalletConnected),
    );
  }

  Widget _buildSecondaryActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ModernButton.secondary(text: 'Gallery', icon: Icons.photo_library_rounded, onPressed: () => _showComingSoon(context, 'Gallery')),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ModernButton.secondary(text: 'Settings', icon: Icons.settings_rounded, onPressed: () => _showComingSoon(context, 'Settings')),
        ),
      ],
    );
  }

  Widget _buildStatsSection(BuildContext context, AppStateModel appState, WidgetRef ref) {
    return Column(
      children: [
        MetricCard(label: 'Photos', value: '${appState.capturedPhotos.length}', icon: Icons.photo_camera_rounded, color: AppTheme.primaryPurple, layout: MetricCardLayout.horizontal),
        const SizedBox(height: 12),
        MetricCard(label: 'NFTs', value: '${appState.userNFTs.length}', icon: Icons.token_rounded, color: AppTheme.primaryGreen, layout: MetricCardLayout.horizontal),
        const SizedBox(height: 12),
        MetricCard(label: 'Balance', value: '${ref.watch(walletBalanceProvider).toStringAsFixed(2)} SOL', icon: Icons.account_balance_wallet_rounded, color: AppTheme.success, layout: MetricCardLayout.horizontal),
      ],
    );
  }

  // 相机相关方法
  Future<void> _openCamera(BuildContext context, WidgetRef ref) async {
    try {
      // 请求相机权限
      final hasPermission = await _requestCameraPermission(context);
      if (!hasPermission) return;

      if (!context.mounted) return;

      // 导航到相机页面
      final result = await Navigator.of(context).push<String>(MaterialPageRoute(builder: (context) => const CameraScreen()));

      if (result != null && context.mounted) {
        // 拍照完成，导航到编辑器
        final editorResult = await Navigator.of(context).push<Map<String, dynamic>>(MaterialPageRoute(builder: (context) => PhotoEditorScreen(imagePath: result)));

        if (editorResult != null && context.mounted) {
          // 照片编辑完成，进入NFT铸造
          _showMintingDialog(context, editorResult);
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to open camera: $e'), backgroundColor: Colors.red));
      }
    }
  }

  Future<bool> _requestCameraPermission(BuildContext context) async {
    final status = await Permission.camera.request();
    if (status.isDenied) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Camera permission is required to take photos')));
      }
      return false;
    }
    return true;
  }

  void _showMintingDialog(BuildContext context, Map<String, dynamic> photoData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MintNFTScreen(initialImagePath: photoData['imagePath'] as String?, photoData: photoData),
      ),
    );
  }

  // 钱包相关方法
  void _showWalletDialog(BuildContext context, WidgetRef ref) {
    final isConnected = ref.read(isWalletConnectedProvider);

    if (isConnected) {
      _showDisconnectDialog(context, ref);
    } else {
      _connectWalletWithMWA(context, ref);
    }
  }

  Future<void> _connectWalletWithMWA(BuildContext context, WidgetRef ref) async {
    try {
      // 显示现代化加载指示器
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const ModernLoadingDialog(title: 'Connecting to wallet...', subtitle: 'Mobile Wallet Adapter will help you select and connect to your wallet.'),
      );

      // 连接钱包 - MWA will handle wallet selection automatically
      await ref.read(walletActionsProvider.notifier).connectWallet();

      // 关闭加载对话框
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wallet connected successfully!'), backgroundColor: Colors.green));
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to connect wallet: $e'), backgroundColor: Colors.red));
      }
    }
  }

  void _showDisconnectDialog(BuildContext context, WidgetRef ref) {
    final wallet = ref.read(appStateProvider).connectedWallet;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Wallet Connected'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Connected to: ${wallet?.name ?? 'Unknown'}'),
            const SizedBox(height: 8),
            Text('Address: ${wallet?.publicKey.substring(0, 8)}...${wallet?.publicKey.substring(wallet.publicKey.length - 8)}', style: const TextStyle(fontFamily: 'monospace')),
            const SizedBox(height: 16),
            const Text('You can now mint NFTs and manage your digital assets.'),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close')),
          ElevatedButton(
            onPressed: () => _disconnectWallet(context, ref),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Disconnect'),
          ),
        ],
      ),
    );
  }

  Future<void> _disconnectWallet(BuildContext context, WidgetRef ref) async {
    try {
      // 关闭对话框
      Navigator.of(context).pop();

      // 显示加载指示器
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const AlertDialog(
          content: Column(mainAxisSize: MainAxisSize.min, children: [CircularProgressIndicator(), SizedBox(height: 16), Text('Disconnecting wallet...')]),
        ),
      );

      // 断开钱包连接
      await ref.read(walletActionsProvider.notifier).disconnectWallet();

      // 关闭加载对话框
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wallet disconnected successfully!'), backgroundColor: Colors.orange));
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to disconnect wallet: $e'), backgroundColor: Colors.red));
      }
    }
  }

  // 工具方法
  IconData _getStatusIcon(AppStatus status) {
    switch (status) {
      case AppStatus.initializing:
        return Icons.hourglass_empty;
      case AppStatus.ready:
        return Icons.check_circle;
      case AppStatus.error:
        return Icons.error;
      case AppStatus.loading:
        return Icons.refresh;
      case AppStatus.offline:
        return Icons.wifi_off;
    }
  }

  Color _getStatusColor(AppStatus status) {
    switch (status) {
      case AppStatus.initializing:
        return Colors.orange;
      case AppStatus.ready:
        return Colors.green;
      case AppStatus.error:
        return Colors.red;
      case AppStatus.loading:
        return Colors.blue;
      case AppStatus.offline:
        return Colors.grey;
    }
  }

  String _getStatusText(AppStatus status) {
    switch (status) {
      case AppStatus.initializing:
        return 'Initializing...';
      case AppStatus.ready:
        return 'Ready to capture';
      case AppStatus.error:
        return 'Error occurred';
      case AppStatus.loading:
        return 'Loading...';
      case AppStatus.offline:
        return 'Offline';
    }
  }

  bool _canTakePhoto(AppStatus status, bool isWalletConnected) {
    return status == AppStatus.ready && isWalletConnected;
  }

  String _getActionButtonText(AppStatus status, bool isWalletConnected) {
    if (status != AppStatus.ready) {
      return 'App Initializing...';
    }
    if (!isWalletConnected) {
      return 'Connect Wallet to Continue';
    }
    return 'Take Photo & Mint NFT';
  }

  void _showActionRequirement(BuildContext context, WidgetRef ref, AppStatus status, bool isWalletConnected) {
    if (status != AppStatus.ready) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please wait for the app to finish initializing.'), backgroundColor: Colors.orange));
    } else if (!isWalletConnected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please connect your wallet first.'),
          backgroundColor: Colors.blue,
          action: SnackBarAction(label: 'Connect', textColor: Colors.white, onPressed: () => _showWalletDialog(context, ref)),
        ),
      );
    }
  }

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$feature feature coming soon!'), backgroundColor: Colors.blue));
  }
}
