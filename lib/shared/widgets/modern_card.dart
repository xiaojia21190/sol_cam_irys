import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';

enum ModernCardStyle { elevated, outlined, filled, gradient }

class ModernCard extends StatefulWidget {
  final Widget child;
  final ModernCardStyle style;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final bool isInteractive;
  final Color? backgroundColor;
  final Gradient? gradient;
  final double? borderRadius;
  final List<BoxShadow>? shadows;

  const ModernCard({super.key, required this.child, this.style = ModernCardStyle.elevated, this.padding, this.margin, this.onTap, this.isInteractive = false, this.backgroundColor, this.gradient, this.borderRadius, this.shadows});

  const ModernCard.elevated({super.key, required this.child, this.padding, this.margin, this.onTap, this.isInteractive = false, this.backgroundColor, this.borderRadius}) : style = ModernCardStyle.elevated, gradient = null, shadows = null;

  const ModernCard.outlined({super.key, required this.child, this.padding, this.margin, this.onTap, this.isInteractive = false, this.backgroundColor, this.borderRadius}) : style = ModernCardStyle.outlined, gradient = null, shadows = null;

  const ModernCard.filled({super.key, required this.child, this.padding, this.margin, this.onTap, this.isInteractive = false, this.backgroundColor, this.borderRadius}) : style = ModernCardStyle.filled, gradient = null, shadows = null;

  const ModernCard.gradient({super.key, required this.child, this.padding, this.margin, this.onTap, this.isInteractive = false, required this.gradient, this.borderRadius}) : style = ModernCardStyle.gradient, backgroundColor = null, shadows = null;

  @override
  State<ModernCard> createState() => _ModernCardState();
}

class _ModernCardState extends State<ModernCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  // late Animation<double> _elevationAnimation; // 暂时不使用

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: AppConstants.shortAnimationDuration, vsync: this);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    // _elevationAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  BoxDecoration get _decoration {
    final borderRadius = BorderRadius.circular(widget.borderRadius ?? AppConstants.defaultBorderRadius);

    switch (widget.style) {
      case ModernCardStyle.elevated:
        return BoxDecoration(color: widget.backgroundColor ?? Colors.white, borderRadius: borderRadius, boxShadow: widget.shadows ?? AppTheme.softShadow);

      case ModernCardStyle.outlined:
        return BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: borderRadius,
          border: Border.all(color: AppTheme.neutral200, width: 1),
        );

      case ModernCardStyle.filled:
        return BoxDecoration(color: widget.backgroundColor ?? AppTheme.neutral100, borderRadius: borderRadius);

      case ModernCardStyle.gradient:
        return BoxDecoration(gradient: widget.gradient ?? AppTheme.primaryGradient, borderRadius: borderRadius, boxShadow: widget.shadows ?? AppTheme.softShadow);
    }
  }

  Widget _buildCard() {
    return Container(
      margin: widget.margin,
      decoration: _decoration,
      child: Padding(padding: widget.padding ?? const EdgeInsets.all(AppConstants.defaultPadding), child: widget.child),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget card = _buildCard();

    if (widget.onTap != null || widget.isInteractive) {
      card = GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => _animationController.forward(),
        onTapUp: (_) => _animationController.reverse(),
        onTapCancel: () => _animationController.reverse(),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(scale: _scaleAnimation.value, child: card);
          },
        ),
      );
    }

    return card;
  }
}

// 特殊用途的卡片组件
class StatusCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback? onTap;

  const StatusCard({super.key, required this.title, required this.subtitle, required this.icon, this.iconColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ModernCard.elevated(
      onTap: onTap,
      isInteractive: onTap != null,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: (iconColor ?? AppTheme.primaryPurple).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(AppConstants.smallBorderRadius)),
            child: Icon(icon, color: iconColor ?? AppTheme.primaryPurple, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 4),
                Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          if (onTap != null) Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.neutral400),
        ],
      ),
    );
  }
}

class MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final Color? color;
  final String? trend;
  final bool isPositiveTrend;

  const MetricCard({super.key, required this.label, required this.value, this.icon, this.color, this.trend, this.isPositiveTrend = true});

  @override
  Widget build(BuildContext context) {
    return ModernCard.filled(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[Icon(icon, size: 20, color: color ?? AppTheme.neutral600), const SizedBox(width: 8)],
              Expanded(child: Text(label, style: Theme.of(context).textTheme.bodyMedium)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: color ?? AppTheme.neutral800, fontWeight: FontWeight.bold),
          ),
          if (trend != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(isPositiveTrend ? Icons.trending_up : Icons.trending_down, size: 16, color: isPositiveTrend ? AppTheme.success : AppTheme.error),
                const SizedBox(width: 4),
                Text(
                  trend!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: isPositiveTrend ? AppTheme.success : AppTheme.error, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
