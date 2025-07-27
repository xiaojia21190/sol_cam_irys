import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../providers/mint_process_provider.dart';
import '../../providers/app_state_provider.dart';
import '../../core/theme/app_theme.dart';
import '../../shared/widgets/modern_button.dart';
import '../../shared/widgets/modern_card.dart';
import '../../shared/widgets/modern_nft_card.dart';
import '../../shared/widgets/modern_loading.dart';
import '../../shared/widgets/server_status_card.dart';

class MintNFTScreen extends ConsumerStatefulWidget {
  final String? initialImagePath;
  final Map<String, dynamic>? photoData;

  const MintNFTScreen({super.key, this.initialImagePath, this.photoData});

  @override
  ConsumerState<MintNFTScreen> createState() => _MintNFTScreenState();
}

class _MintNFTScreenState extends ConsumerState<MintNFTScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _selectedImage;
  final _imagePicker = ImagePicker();
  bool _usePublicStorage = false; // 新增：存储方式选择

  @override
  void initState() {
    super.initState();
    // 如果有传入的图片路径，则使用它
    if (widget.initialImagePath != null) {
      _selectedImage = File(widget.initialImagePath!);
    }

    // 设置默认的 NFT 名称和描述
    _nameController.text = 'SolanaLens Photo ${DateTime.now().millisecondsSinceEpoch}';
    _descriptionController.text = 'Captured with SolanaLens - A decentralized photo NFT';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery, maxWidth: 2048, maxHeight: 2048, imageQuality: 90);

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('选择图片失败: $e')));
      }
    }
  }

  Future<void> _startMinting() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('请先选择一张图片')));
      return;
    }

    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('请输入 NFT 名称')));
      return;
    }

    if (_descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('请输入 NFT 描述')));
      return;
    }

    // 开始铸造流程
    await ref
        .read(mintProcessProvider.notifier)
        .startMinting(
          imageFile: _selectedImage!,
          nftName: _nameController.text.trim(),
          nftDescription: _descriptionController.text.trim(),
          additionalTags: {'Creator': 'SolanaLens User', 'Platform': 'Mobile'},
          usePublicStorage: _usePublicStorage, // 传递存储方式选择
        );
  }

  @override
  Widget build(BuildContext context) {
    final mintState = ref.watch(mintProcessProvider);
    final isWalletConnected = ref.watch(isWalletConnectedProvider);

    return Scaffold(
      backgroundColor: AppTheme.neutral50,
      body: CustomScrollView(
        slivers: [
          // Modern App Bar
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            foregroundColor: AppTheme.neutral800,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Mint NFT',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: AppTheme.neutral800),
              ),
              background: Container(decoration: const BoxDecoration(gradient: AppTheme.primaryGradient)),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Wallet Status Card
                  _buildWalletStatusCard(isWalletConnected),

                  const SizedBox(height: 20),

                  // Server Status Card (只在使用公共存储时显示)
                  if (_usePublicStorage) ...[const ServerStatusCard(), const SizedBox(height: 20)],

                  // Image Selection Card
                  _buildImageSelectionCard(mintState),

                  const SizedBox(height: 20),

                  // NFT Information Card
                  _buildNFTInfoCard(mintState),

                  const SizedBox(height: 20),

                  // Storage Options Card
                  _buildStorageOptionsCard(mintState),

                  // Progress Card
                  if (mintState.isLoading || mintState.isCompleted || mintState.isFailed) _buildProgressCard(mintState),

                  if (mintState.isLoading || mintState.isCompleted || mintState.isFailed) const SizedBox(height: 20),

                  // Mint Button
                  _buildMintButton(isWalletConnected, mintState),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWalletStatusCard(bool isWalletConnected) {
    return StatusCard(
      title: isWalletConnected ? 'Wallet Connected' : 'Wallet Not Connected',
      subtitle: isWalletConnected ? 'Ready to mint NFTs' : 'Please connect your wallet first',
      icon: isWalletConnected ? Icons.account_balance_wallet : Icons.wallet,
      iconColor: isWalletConnected ? AppTheme.success : AppTheme.neutral400,
    );
  }

  Widget _buildImageSelectionCard(dynamic mintState) {
    return ModernCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.image_rounded, color: AppTheme.primaryPurple, size: 24),
              const SizedBox(width: 8),
              Text('Select Image', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),

          if (_selectedImage != null) ...[ModernNFTCard(imageFile: _selectedImage, title: 'Preview', description: 'Your selected image'), const SizedBox(height: 16)],

          ModernButton.primary(text: _selectedImage == null ? 'Choose Image' : 'Change Image', icon: _selectedImage == null ? Icons.add_photo_alternate : Icons.edit, isFullWidth: true, onPressed: mintState.isLoading ? null : _pickImage),
        ],
      ),
    );
  }

  Widget _buildNFTInfoCard(dynamic mintState) {
    return ModernCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline_rounded, color: AppTheme.primaryPurple, size: 24),
              const SizedBox(width: 8),
              Text('NFT Information', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 20),

          TextField(
            controller: _nameController,
            enabled: !mintState.isLoading,
            decoration: InputDecoration(
              labelText: 'NFT Name',
              hintText: 'Enter your NFT name',
              prefixIcon: Icon(Icons.title, color: AppTheme.primaryPurple),
            ),
            maxLength: 50,
          ),

          const SizedBox(height: 16),

          TextField(
            controller: _descriptionController,
            enabled: !mintState.isLoading,
            decoration: InputDecoration(
              labelText: 'NFT Description',
              hintText: 'Describe your NFT',
              prefixIcon: Icon(Icons.description, color: AppTheme.primaryPurple),
            ),
            maxLines: 3,
            maxLength: 200,
          ),
        ],
      ),
    );
  }

  Widget _buildStorageOptionsCard(dynamic mintState) {
    return ModernCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.cloud_upload_rounded, color: AppTheme.primaryPurple, size: 24),
              const SizedBox(width: 8),
              Text('存储选项', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),

          // 本地存储选项
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: !_usePublicStorage ? AppTheme.primaryPurple.withValues(alpha: 0.1) : AppTheme.neutral100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: !_usePublicStorage ? AppTheme.primaryPurple : AppTheme.neutral300, width: !_usePublicStorage ? 2 : 1),
            ),
            child: Row(
              children: [
                Radio<bool>(
                  value: false,
                  groupValue: _usePublicStorage,
                  onChanged: mintState.isLoading
                      ? null
                      : (value) {
                          setState(() {
                            _usePublicStorage = value!;
                          });
                        },
                  activeColor: AppTheme.primaryPurple,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('本地存储 (推荐)', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text('✅ 完全免费\n✅ 即时保存\n⚠️ 仅在此设备可见', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.neutral600)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // 公共存储选项
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _usePublicStorage ? AppTheme.primaryPurple.withValues(alpha: 0.1) : AppTheme.neutral100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: _usePublicStorage ? AppTheme.primaryPurple : AppTheme.neutral300, width: _usePublicStorage ? 2 : 1),
            ),
            child: Row(
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: _usePublicStorage,
                  onChanged: mintState.isLoading
                      ? null
                      : (value) {
                          setState(() {
                            _usePublicStorage = value!;
                          });
                        },
                  activeColor: AppTheme.primaryPurple,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Irys 分布式存储', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text('✅ 永久存储\n✅ 全球可访问\n✅ 去中心化\n✅ 钱包/市场兼容', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.neutral600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(dynamic mintState) {
    if (!mintState.isLoading && !mintState.isCompleted && !mintState.isFailed) {
      return const SizedBox.shrink();
    }

    return ModernCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (mintState.isLoading) const ModernLoadingIndicator(size: 24) else if (mintState.isCompleted) const Icon(Icons.check_circle, color: AppTheme.success, size: 24) else if (mintState.isFailed) const Icon(Icons.error, color: AppTheme.error, size: 24),

              const SizedBox(width: 12),

              Expanded(
                child: Text(mintState.message ?? 'Preparing...', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              ),
            ],
          ),

          if (mintState.isLoading) ...[
            const SizedBox(height: 16),
            LinearProgressIndicator(value: mintState.progress, backgroundColor: AppTheme.neutral200, valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryPurple)),
            const SizedBox(height: 8),
            Text('${(mintState.progress * 100).toInt()}% Complete', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.neutral600)),
          ],

          if (mintState.isFailed && mintState.errorMessage != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.error.withValues(alpha: 0.3)),
              ),
              child: Text(mintState.errorMessage!, style: const TextStyle(color: AppTheme.error)),
            ),
          ],

          if (mintState.isCompleted && mintState.completedNFT != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.success.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.success.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'NFT Minted Successfully!',
                    style: TextStyle(color: AppTheme.success, fontWeight: FontWeight.bold),
                  ),
                  if (mintState.transactionSignature != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Transaction: ${mintState.transactionSignature!.substring(0, 16)}...',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.neutral600, fontFamily: 'monospace'),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMintButton(bool isWalletConnected, dynamic mintState) {
    return Column(
      children: [
        ModernButton.primary(
          text: !isWalletConnected
              ? 'Connect Wallet First'
              : _selectedImage == null
              ? 'Select Image First'
              : 'Mint NFT',
          icon: Icons.auto_awesome_rounded,
          size: ModernButtonSize.large,
          isFullWidth: true,
          isLoading: mintState.isLoading,
          onPressed: (!isWalletConnected || _selectedImage == null || mintState.isLoading) ? null : _startMinting,
        ),

        // Reset button
        if (mintState.isCompleted || mintState.isFailed) ...[
          const SizedBox(height: 12),
          ModernButton.secondary(
            text: 'Start Over',
            icon: Icons.refresh_rounded,
            onPressed: () {
              ref.read(mintProcessProvider.notifier).reset();
              setState(() {
                _selectedImage = null;
                _nameController.clear();
                _descriptionController.clear();
                _usePublicStorage = false;
              });
            },
          ),
        ],
      ],
    );
  }
}
