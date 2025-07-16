import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';

enum ModernButtonStyle { primary, secondary, outline, ghost, success, warning, error }

enum ModernButtonSize { small, medium, large }

class ModernButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final ModernButtonStyle style;
  final ModernButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? child;

  const ModernButton({super.key, required this.text, this.onPressed, this.style = ModernButtonStyle.primary, this.size = ModernButtonSize.medium, this.icon, this.isLoading = false, this.isFullWidth = false, this.child});

  const ModernButton.primary({super.key, required this.text, this.onPressed, this.size = ModernButtonSize.medium, this.icon, this.isLoading = false, this.isFullWidth = false, this.child}) : style = ModernButtonStyle.primary;

  const ModernButton.secondary({super.key, required this.text, this.onPressed, this.size = ModernButtonSize.medium, this.icon, this.isLoading = false, this.isFullWidth = false, this.child}) : style = ModernButtonStyle.secondary;

  const ModernButton.outline({super.key, required this.text, this.onPressed, this.size = ModernButtonSize.medium, this.icon, this.isLoading = false, this.isFullWidth = false, this.child}) : style = ModernButtonStyle.outline;

  const ModernButton.success({super.key, required this.text, this.onPressed, this.size = ModernButtonSize.medium, this.icon, this.isLoading = false, this.isFullWidth = false, this.child}) : style = ModernButtonStyle.success;

  const ModernButton.warning({super.key, required this.text, this.onPressed, this.size = ModernButtonSize.medium, this.icon, this.isLoading = false, this.isFullWidth = false, this.child}) : style = ModernButtonStyle.warning;

  const ModernButton.error({super.key, required this.text, this.onPressed, this.size = ModernButtonSize.medium, this.icon, this.isLoading = false, this.isFullWidth = false, this.child}) : style = ModernButtonStyle.error;

  @override
  State<ModernButton> createState() => _ModernButtonState();
}

class _ModernButtonState extends State<ModernButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: AppConstants.shortAnimationDuration, vsync: this);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  EdgeInsets get _padding {
    switch (widget.size) {
      case ModernButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      case ModernButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      case ModernButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
    }
  }

  double get _fontSize {
    switch (widget.size) {
      case ModernButtonSize.small:
        return 14;
      case ModernButtonSize.medium:
        return 16;
      case ModernButtonSize.large:
        return 18;
    }
  }

  ButtonStyle get _buttonStyle {
    final isEnabled = widget.onPressed != null && !widget.isLoading;

    switch (widget.style) {
      case ModernButtonStyle.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppTheme.primaryPurple : AppTheme.neutral300,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: _padding,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius)),
          textStyle: TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w600),
        );

      case ModernButtonStyle.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppTheme.neutral100 : AppTheme.neutral200,
          foregroundColor: isEnabled ? AppTheme.neutral800 : AppTheme.neutral500,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: _padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
            side: BorderSide(color: isEnabled ? AppTheme.neutral200 : AppTheme.neutral300),
          ),
          textStyle: TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w600),
        );

      case ModernButtonStyle.outline:
        return OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: isEnabled ? AppTheme.primaryPurple : AppTheme.neutral500,
          elevation: 0,
          padding: _padding,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius)),
          side: BorderSide(color: isEnabled ? AppTheme.primaryPurple : AppTheme.neutral300, width: 1.5),
          textStyle: TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w600),
        );

      case ModernButtonStyle.ghost:
        return TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: isEnabled ? AppTheme.primaryPurple : AppTheme.neutral500,
          elevation: 0,
          padding: _padding,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius)),
          textStyle: TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w600),
        );

      case ModernButtonStyle.success:
        return ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppTheme.success : AppTheme.neutral300,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: _padding,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius)),
          textStyle: TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w600),
        );

      case ModernButtonStyle.warning:
        return ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppTheme.warning : AppTheme.neutral300,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: _padding,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius)),
          textStyle: TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w600),
        );

      case ModernButtonStyle.error:
        return ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppTheme.error : AppTheme.neutral300,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: _padding,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius)),
          textStyle: TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w600),
        );
    }
  }

  Widget _buildButtonContent() {
    if (widget.isLoading) {
      return SizedBox(
        height: _fontSize + 2,
        width: _fontSize + 2,
        child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(widget.style == ModernButtonStyle.outline || widget.style == ModernButtonStyle.ghost ? AppTheme.primaryPurple : Colors.white)),
      );
    }

    if (widget.child != null) {
      return widget.child!;
    }

    final List<Widget> children = [];

    if (widget.icon != null) {
      children.add(Icon(widget.icon, size: _fontSize + 2));
      children.add(const SizedBox(width: 8));
    }

    children.add(Text(widget.text));

    return Row(mainAxisSize: MainAxisSize.min, children: children);
  }

  @override
  Widget build(BuildContext context) {
    Widget button;

    switch (widget.style) {
      case ModernButtonStyle.primary:
      case ModernButtonStyle.secondary:
      case ModernButtonStyle.success:
      case ModernButtonStyle.warning:
      case ModernButtonStyle.error:
        button = ElevatedButton(onPressed: widget.isLoading ? null : widget.onPressed, style: _buttonStyle, child: _buildButtonContent());
        break;

      case ModernButtonStyle.outline:
        button = OutlinedButton(onPressed: widget.isLoading ? null : widget.onPressed, style: _buttonStyle, child: _buildButtonContent());
        break;

      case ModernButtonStyle.ghost:
        button = TextButton(onPressed: widget.isLoading ? null : widget.onPressed, style: _buttonStyle, child: _buildButtonContent());
        break;
    }

    if (widget.isFullWidth) {
      button = SizedBox(width: double.infinity, child: button);
    }

    return GestureDetector(
      onTapDown: (_) => _animationController.forward(),
      onTapUp: (_) => _animationController.reverse(),
      onTapCancel: () => _animationController.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(scale: _scaleAnimation.value, child: button);
        },
      ),
    );
  }
}
