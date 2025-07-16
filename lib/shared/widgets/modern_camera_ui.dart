import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';

class ModernCameraUI extends StatefulWidget {
  final CameraController? controller;
  final bool isInitialized;
  final bool isCapturing;
  final FlashMode flashMode;
  final VoidCallback onCapture;
  final VoidCallback onSwitchCamera;
  final VoidCallback onToggleFlash;
  final VoidCallback onClose;
  final VoidCallback? onToggleGrid;
  final bool showGrid;

  const ModernCameraUI({super.key, required this.controller, required this.isInitialized, required this.isCapturing, required this.flashMode, required this.onCapture, required this.onSwitchCamera, required this.onToggleFlash, required this.onClose, this.onToggleGrid, this.showGrid = false});

  @override
  State<ModernCameraUI> createState() => _ModernCameraUIState();
}

class _ModernCameraUIState extends State<ModernCameraUI> with TickerProviderStateMixin {
  late AnimationController _captureAnimationController;
  late AnimationController _flashAnimationController;
  late Animation<double> _captureScaleAnimation;
  late Animation<double> _flashOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _captureAnimationController = AnimationController(duration: AppConstants.shortAnimationDuration, vsync: this);
    _flashAnimationController = AnimationController(duration: const Duration(milliseconds: 100), vsync: this);

    _captureScaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(CurvedAnimation(parent: _captureAnimationController, curve: Curves.easeInOut));

    _flashOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_flashAnimationController);
  }

  @override
  void dispose() {
    _captureAnimationController.dispose();
    _flashAnimationController.dispose();
    super.dispose();
  }

  void _handleCapture() {
    _captureAnimationController.forward().then((_) {
      _captureAnimationController.reverse();
    });
    _flashAnimationController.forward().then((_) {
      _flashAnimationController.reverse();
    });
    widget.onCapture();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Camera preview
        if (widget.isInitialized && widget.controller != null) Positioned.fill(child: CameraPreview(widget.controller!)) else _buildLoadingState(),

        // Grid overlay
        if (widget.showGrid && widget.isInitialized) Positioned.fill(child: _buildGridOverlay()),

        // Flash overlay
        AnimatedBuilder(
          animation: _flashOpacityAnimation,
          builder: (context, child) {
            return Positioned.fill(
              child: Container(color: Colors.white.withValues(alpha: _flashOpacityAnimation.value * 0.8)),
            );
          },
        ),

        // Top gradient and controls
        _buildTopSection(),

        // Bottom gradient and controls
        _buildBottomSection(),
      ],
    );
  }

  Widget _buildLoadingState() {
    return Container(
      color: Colors.black,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 60, height: 60, child: CircularProgressIndicator(strokeWidth: 3, valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryPurple))),
            SizedBox(height: 24),
            Text(
              'Initializing Camera...',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridOverlay() {
    return CustomPaint(painter: GridPainter(), child: Container());
  }

  Widget _buildTopSection() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black.withValues(alpha: 0.8), Colors.transparent], stops: const [0.0, 1.0]),
        ),
        child: SafeArea(
          child: Container(
            height: 60, // Fixed height for consistent layout
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTopButton(icon: Icons.close_rounded, onPressed: widget.onClose),
                _buildModeIndicator(),
                _buildTopButton(icon: _getFlashIcon(), onPressed: widget.onToggleFlash, isActive: widget.flashMode != FlashMode.off),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black.withValues(alpha: 0.9), Colors.transparent]),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Main controls row
                SizedBox(
                  height: 80, // Fixed height for capture button
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left side button
                      _buildBottomButton(icon: Icons.grid_3x3_rounded, onPressed: widget.onToggleGrid, isActive: widget.showGrid),

                      // Center capture button
                      _buildCaptureButton(),

                      // Right side button
                      _buildBottomButton(icon: Icons.flip_camera_ios_rounded, onPressed: widget.onSwitchCamera),
                    ],
                  ),
                ),
                const SizedBox(height: 8), // Reduced bottom spacing
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopButton({required IconData icon, required VoidCallback? onPressed, bool isActive = false}) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(22),
        border: isActive ? Border.all(color: AppTheme.primaryPurple, width: 2) : null,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: isActive ? AppTheme.primaryPurple : Colors.white, size: 22),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildModeIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(20)),
      child: const Text(
        'PHOTO',
        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 1.2),
      ),
    );
  }

  Widget _buildBottomButton({required IconData icon, VoidCallback? onPressed, bool isActive = false}) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: isActive ? AppTheme.primaryPurple.withValues(alpha: 0.2) : Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(25),
        border: isActive ? Border.all(color: AppTheme.primaryPurple, width: 2) : Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: isActive ? AppTheme.primaryPurple : Colors.white, size: 24),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildCaptureButton() {
    return AnimatedBuilder(
      animation: _captureScaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _captureScaleAnimation.value,
          child: GestureDetector(
            onTap: widget.isCapturing ? null : _handleCapture,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 4),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 2))],
              ),
              child: widget.isCapturing
                  ? const Center(
                      child: SizedBox(width: 30, height: 30, child: CircularProgressIndicator(strokeWidth: 3, valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryPurple))),
                    )
                  : const Icon(Icons.camera_alt_rounded, color: AppTheme.primaryPurple, size: 32),
            ),
          ),
        );
      },
    );
  }

  IconData _getFlashIcon() {
    switch (widget.flashMode) {
      case FlashMode.auto:
        return Icons.flash_auto_rounded;
      case FlashMode.always:
        return Icons.flash_on_rounded;
      case FlashMode.off:
        return Icons.flash_off_rounded;
      default:
        return Icons.flash_auto_rounded;
    }
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..strokeWidth = 1;

    // Vertical lines
    canvas.drawLine(Offset(size.width / 3, 0), Offset(size.width / 3, size.height), paint);
    canvas.drawLine(Offset(size.width * 2 / 3, 0), Offset(size.width * 2 / 3, size.height), paint);

    // Horizontal lines
    canvas.drawLine(Offset(0, size.height / 3), Offset(size.width, size.height / 3), paint);
    canvas.drawLine(Offset(0, size.height * 2 / 3), Offset(size.width, size.height * 2 / 3), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
