import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera/camera.dart';
import '../../shared/widgets/modern_camera_ui.dart';

class CameraScreen extends ConsumerStatefulWidget {
  const CameraScreen({super.key});

  @override
  ConsumerState<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends ConsumerState<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  int _currentCameraIndex = 0;
  bool _isInitialized = false;
  bool _isCapturing = false;
  FlashMode _flashMode = FlashMode.auto;
  bool _showGrid = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isNotEmpty) {
        await _createController(_cameras[_currentCameraIndex]);
      }
    } catch (e) {
      _showError('Failed to initialize camera: $e');
    }
  }

  Future<void> _createController(CameraDescription camera) async {
    await _controller?.dispose();

    _controller = CameraController(camera, ResolutionPreset.high, enableAudio: false, imageFormatGroup: ImageFormatGroup.jpeg);

    try {
      await _controller!.initialize();
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      _showError('Failed to initialize camera controller: $e');
    }
  }

  Future<void> _takePicture() async {
    if (!_isInitialized || _controller == null || _isCapturing) return;

    try {
      setState(() {
        _isCapturing = true;
      });

      final XFile image = await _controller!.takePicture();

      // Show success feedback
      _showSuccess('Photo captured successfully!');

      // Navigate back with the captured image path
      if (mounted) {
        Navigator.of(context).pop(image.path);
      }
    } catch (e) {
      _showError('Failed to take picture: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isCapturing = false;
        });
      }
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras.length <= 1) return;

    _currentCameraIndex = (_currentCameraIndex + 1) % _cameras.length;
    await _createController(_cameras[_currentCameraIndex]);
  }

  Future<void> _toggleFlash() async {
    if (_controller == null) return;

    FlashMode newMode;
    switch (_flashMode) {
      case FlashMode.auto:
        newMode = FlashMode.always;
        break;
      case FlashMode.always:
        newMode = FlashMode.off;
        break;
      case FlashMode.off:
        newMode = FlashMode.auto;
        break;
      default:
        newMode = FlashMode.auto;
    }

    try {
      await _controller!.setFlashMode(newMode);
      setState(() {
        _flashMode = newMode;
      });
    } catch (e) {
      _showError('Failed to set flash mode: $e');
    }
  }

  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red));
    }
  }

  void _showSuccess(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.green));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModernCameraUI(
        controller: _controller,
        isInitialized: _isInitialized,
        isCapturing: _isCapturing,
        flashMode: _flashMode,
        showGrid: _showGrid,
        onCapture: _takePicture,
        onSwitchCamera: _switchCamera,
        onToggleFlash: _toggleFlash,
        onClose: () => Navigator.of(context).pop(),
        onToggleGrid: () => setState(() => _showGrid = !_showGrid),
      ),
    );
  }
}
