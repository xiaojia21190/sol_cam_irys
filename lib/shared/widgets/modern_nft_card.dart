import 'dart:io';
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';
import 'modern_button.dart';

class ModernNFTCard extends StatefulWidget {
  final File? imageFile;
  final String? imageUrl;
  final String title;
  final String description;
  final String? price;
  final String? creator;
  final bool isSelected;
  final bool showActions;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onShare;
  final VoidCallback? onDelete;

  const ModernNFTCard({super.key, this.imageFile, this.imageUrl, required this.title, required this.description, this.price, this.creator, this.isSelected = false, this.showActions = false, this.onTap, this.onEdit, this.onShare, this.onDelete});

  @override
  State<ModernNFTCard> createState() => _ModernNFTCardState();
}

class _ModernNFTCardState extends State<ModernNFTCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  // late Animation<double> _elevationAnimation; // 暂时不使用

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: AppConstants.shortAnimationDuration, vsync: this);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    // _elevationAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildImage() {
    Widget imageWidget;

    if (widget.imageFile != null) {
      imageWidget = Image.file(widget.imageFile!, fit: BoxFit.cover, width: double.infinity, height: 200);
    } else if (widget.imageUrl != null) {
      // 检查是否是本地文件路径
      if (widget.imageUrl!.startsWith('file://')) {
        // 移除 file:// 前缀并使用 Image.file()
        final filePath = widget.imageUrl!.substring(7);
        imageWidget = Image.file(
          File(filePath),
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
          errorBuilder: (context, error, stackTrace) {
            return _buildPlaceholder();
          },
        );
      } else if (widget.imageUrl!.startsWith('/')) {
        // 直接是本地文件路径
        imageWidget = Image.file(
          File(widget.imageUrl!),
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
          errorBuilder: (context, error, stackTrace) {
            return _buildPlaceholder();
          },
        );
      } else {
        // 网络图片
        imageWidget = Image.network(
          widget.imageUrl!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              height: 200,
              color: AppTheme.neutral100,
              child: Center(
                child: CircularProgressIndicator(value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null, valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryPurple)),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return _buildPlaceholder();
          },
        );
      }
    } else {
      imageWidget = _buildPlaceholder();
    }

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(AppConstants.defaultBorderRadius)),
      child: imageWidget,
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppConstants.defaultBorderRadius)),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_rounded, size: 48, color: Colors.white),
            SizedBox(height: 8),
            Text(
              'No Image',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and price row
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (widget.price != null) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: AppTheme.primaryPurple.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(AppConstants.smallBorderRadius)),
                  child: Text(
                    widget.price!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.primaryPurple, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ],
          ),

          const SizedBox(height: 8),

          // Description
          Text(
            widget.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.neutral600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          if (widget.creator != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(gradient: AppTheme.primaryGradient, borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.person_rounded, size: 14, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'by ${widget.creator}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.neutral500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],

          // Actions
          if (widget.showActions) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                if (widget.onEdit != null)
                  Expanded(
                    child: ModernButton.secondary(text: 'Edit', icon: Icons.edit_rounded, size: ModernButtonSize.small, onPressed: widget.onEdit),
                  ),
                if (widget.onEdit != null && widget.onShare != null) const SizedBox(width: 8),
                if (widget.onShare != null)
                  Expanded(
                    child: ModernButton.outline(text: 'Share', icon: Icons.share_rounded, size: ModernButtonSize.small, onPressed: widget.onShare),
                  ),
                if (widget.onDelete != null) ...[const SizedBox(width: 8), ModernButton.error(text: '', icon: Icons.delete_rounded, size: ModernButtonSize.small, onPressed: widget.onDelete)],
              ],
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget card = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
        border: widget.isSelected ? Border.all(color: AppTheme.primaryPurple, width: 2) : Border.all(color: AppTheme.neutral200, width: 1),
        boxShadow: AppTheme.softShadow,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_buildImage(), _buildContent()]),
    );

    if (widget.onTap != null) {
      card = GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => _animationController.forward(),
        onTapUp: (_) => _animationController.reverse(),
        onTapCancel: () => _animationController.reverse(),
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(scale: _scaleAnimation.value, child: card);
          },
        ),
      );
    }

    return card;
  }
}

class NFTGridView extends StatelessWidget {
  final List<Map<String, dynamic>> nfts;
  final Function(int index)? onNFTTap;
  final Function(int index)? onNFTEdit;
  final Function(int index)? onNFTShare;
  final Function(int index)? onNFTDelete;
  final bool showActions;

  const NFTGridView({super.key, required this.nfts, this.onNFTTap, this.onNFTEdit, this.onNFTShare, this.onNFTDelete, this.showActions = false});

  @override
  Widget build(BuildContext context) {
    if (nfts.isEmpty) {
      return _buildEmptyState(context);
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.75),
      itemCount: nfts.length,
      itemBuilder: (context, index) {
        final nft = nfts[index];
        return ModernNFTCard(
          imageFile: nft['imageFile'],
          imageUrl: nft['imageUrl'],
          title: nft['title'] ?? 'Untitled NFT',
          description: nft['description'] ?? 'No description',
          price: nft['price'],
          creator: nft['creator'],
          showActions: showActions,
          onTap: onNFTTap != null ? () => onNFTTap!(index) : null,
          onEdit: onNFTEdit != null ? () => onNFTEdit!(index) : null,
          onShare: onNFTShare != null ? () => onNFTShare!(index) : null,
          onDelete: onNFTDelete != null ? () => onNFTDelete!(index) : null,
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(gradient: AppTheme.primaryGradient, borderRadius: BorderRadius.circular(60)),
            child: const Icon(Icons.photo_library_rounded, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text('No NFTs Yet', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(
            'Start creating your first NFT by taking a photo!',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.neutral600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
