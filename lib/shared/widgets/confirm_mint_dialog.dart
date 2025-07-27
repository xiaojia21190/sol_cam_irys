import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import 'modern_button.dart';

/// NFT铸造确认对话框
class ConfirmMintDialog extends ConsumerWidget {
  final File imageFile;
  final String nftName;
  final String nftDescription;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmMintDialog({super.key, required this.imageFile, required this.nftName, required this.nftDescription, required this.onConfirm, required this.onCancel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
        decoration: BoxDecoration(
          color: AppTheme.neutral800,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withAlpha(30), blurRadius: 20, offset: const Offset(0, 10))],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 标题栏
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: AppTheme.primaryPurple.withAlpha(10), borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.warning_amber_rounded, color: AppTheme.primaryPurple, size: 24),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      '确认铸造NFT',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            // 内容区域
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 图片预览
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppTheme.primaryPurple.withAlpha(30), width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          imageFile,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[800],
                              child: const Icon(Icons.error, color: Colors.red, size: 48),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // NFT信息
                    _buildInfoSection('NFT名称', nftName),
                    const SizedBox(height: 12),
                    _buildInfoSection('描述', nftDescription),
                    const SizedBox(height: 20),

                    // 重要提醒
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange.withAlpha(10),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.orange.withAlpha(30), width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.info_outline, color: Colors.orange, size: 20),
                              const SizedBox(width: 8),
                              const Text(
                                '重要提醒',
                                style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '• NFT铸造是不可逆的操作\n'
                            '• 您的照片将永久存储在区块链上\n'
                            '• 铸造完成后无法修改或删除\n'
                            '• 请确认您拥有此照片的版权',
                            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 按钮区域
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: ModernButton.secondary(text: '取消', icon: Icons.close, onPressed: onCancel),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ModernButton.primary(text: '确认铸造', icon: Icons.rocket_launch, onPressed: onConfirm),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: AppTheme.primaryPurple, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[700]!, width: 1),
          ),
          child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ),
      ],
    );
  }
}

/// 显示确认对话框的便捷方法
Future<bool?> showConfirmMintDialog({required BuildContext context, required File imageFile, required String nftName, required String nftDescription}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => ConfirmMintDialog(imageFile: imageFile, nftName: nftName, nftDescription: nftDescription, onConfirm: () => Navigator.of(context).pop(true), onCancel: () => Navigator.of(context).pop(false)),
  );
}
