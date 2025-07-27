import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';
import '../../services/storage_service.dart';
import '../../providers/app_state_provider.dart';
import 'modern_card.dart';
import 'modern_button.dart';

class ServerStatusCard extends ConsumerStatefulWidget {
  const ServerStatusCard({super.key});

  @override
  ConsumerState<ServerStatusCard> createState() => _ServerStatusCardState();
}

class _ServerStatusCardState extends ConsumerState<ServerStatusCard> {
  ServerStatus _status = ServerStatus.unknown;
  String? _errorMessage;
  bool _isChecking = false;

  @override
  void initState() {
    super.initState();
    _checkServerStatus();
  }

  Future<void> _checkServerStatus() async {
    if (_isChecking) return;

    setState(() {
      _isChecking = true;
      _status = ServerStatus.checking;
      _errorMessage = null;
    });

    try {
      final storageService = ref.read(storageServiceProvider);

      if (storageService is IrysServerStorageService) {
        final isOnline = await storageService.checkServerStatus();

        setState(() {
          _status = isOnline ? ServerStatus.online : ServerStatus.offline;
          _isChecking = false;
        });
      } else {
        setState(() {
          _status = ServerStatus.offline;
          _errorMessage = '当前不使用 Irys 服务器存储';
          _isChecking = false;
        });
      }
    } catch (e) {
      setState(() {
        _status = ServerStatus.error;
        _errorMessage = e.toString();
        _isChecking = false;
      });
    }
  }

  Color _getStatusColor() {
    switch (_status) {
      case ServerStatus.online:
        return AppTheme.success;
      case ServerStatus.offline:
        return AppTheme.error;
      case ServerStatus.checking:
        return AppTheme.primaryPurple;
      case ServerStatus.error:
        return AppTheme.error;
      case ServerStatus.unknown:
        return AppTheme.neutral400;
    }
  }

  IconData _getStatusIcon() {
    switch (_status) {
      case ServerStatus.online:
        return Icons.cloud_done;
      case ServerStatus.offline:
        return Icons.cloud_off;
      case ServerStatus.checking:
        return Icons.cloud_sync;
      case ServerStatus.error:
        return Icons.error;
      case ServerStatus.unknown:
        return Icons.help;
    }
  }

  String _getStatusText() {
    switch (_status) {
      case ServerStatus.online:
        return 'Irys 服务器在线';
      case ServerStatus.offline:
        return 'Irys 服务器离线';
      case ServerStatus.checking:
        return '检查服务器状态...';
      case ServerStatus.error:
        return '服务器连接错误';
      case ServerStatus.unknown:
        return '未知状态';
    }
  }

  String _getStatusDescription() {
    switch (_status) {
      case ServerStatus.online:
        return '服务器运行正常，可以上传 NFT 数据';
      case ServerStatus.offline:
        return '无法连接到服务器，请检查服务器是否运行';
      case ServerStatus.checking:
        return '正在检查服务器连接...';
      case ServerStatus.error:
        return _errorMessage ?? '连接时发生错误';
      case ServerStatus.unknown:
        return '点击检查按钮测试服务器连接';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModernCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题行
          Row(
            children: [
              Icon(Icons.dns_rounded, color: AppTheme.primaryPurple, size: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Text('Irys 服务器状态', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
              ),
              if (_isChecking) const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
            ],
          ),

          const SizedBox(height: 16),

          // 服务器地址
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.neutral100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.neutral300),
            ),
            child: Row(
              children: [
                Icon(Icons.link, color: AppTheme.neutral600, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    AppConstants.irysServerUrl,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontFamily: 'monospace', color: AppTheme.neutral700),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 状态显示
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _getStatusColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: _getStatusColor().withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(_getStatusIcon(), color: _getStatusColor(), size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getStatusText(),
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: _getStatusColor(), fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(_getStatusDescription(), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.neutral600)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 环境信息
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryPurple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.primaryPurple.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.settings, color: AppTheme.primaryPurple, size: 16),
                const SizedBox(width: 8),
                Text(
                  '当前环境: ${AppConstants.currentEnvironment.name.toUpperCase()}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.primaryPurple, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 操作按钮
          Row(
            children: [
              Expanded(
                child: ModernButton.secondary(text: '重新检查', icon: Icons.refresh, onPressed: _isChecking ? null : _checkServerStatus),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ModernButton.primary(text: '配置说明', icon: Icons.help_outline, onPressed: () => _showConfigDialog(context)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showConfigDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🔧 Irys 服务器配置'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('配置您的 Irys 服务器环境：', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 16),

              Text('1. 📝 修改 lib/core/constants/app_constants.dart'),
              SizedBox(height: 8),
              Text('2. 🔧 更改 currentEnvironment 值：'),
              SizedBox(height: 8),
              Text('   • AppEnvironment.local (localhost:3000)'),
              Text('   • AppEnvironment.network (局域网)'),
              Text('   • AppEnvironment.production (生产环境)'),
              SizedBox(height: 16),

              Text('3. 🖥️ 确保 Irys 服务器正在运行：'),
              SizedBox(height: 8),
              Text(
                'npm start',
                style: TextStyle(fontFamily: 'monospace', backgroundColor: Color(0xFFF5F5F5)),
              ),
              SizedBox(height: 16),

              Text('4. 🔄 重启 Flutter 应用使配置生效'),
            ],
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('知道了'))],
      ),
    );
  }
}
