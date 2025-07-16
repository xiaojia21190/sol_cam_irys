import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import '../models/photo_model.dart';
import '../core/constants/app_constants.dart';

abstract class CameraService {
  Future<void> initialize();
  Future<void> dispose();
  Future<List<CameraDescription>> getAvailableCameras();
  Future<CameraController?> createController(CameraDescription camera);
  Future<PhotoModel> takePicture(CameraController controller);
  Future<void> switchCamera();
  Future<void> setFlashMode(FlashMode mode);
  Future<void> setFocusMode(FocusMode mode);
  Future<void> setExposureMode(ExposureMode mode);
  Future<void> setZoomLevel(double zoom);

  // Camera state
  CameraController? get currentController;
  CameraDescription? get currentCamera;
  bool get isInitialized;
  bool get isRecording;
  FlashMode get currentFlashMode;
  double get currentZoomLevel;
  double get maxZoomLevel;
  double get minZoomLevel;
}

class CameraServiceImpl implements CameraService {
  CameraController? _controller;
  CameraDescription? _currentCamera;
  List<CameraDescription> _cameras = [];
  int _currentCameraIndex = 0;
  bool _isInitialized = false;
  double _currentZoomLevel = AppConstants.defaultZoomLevel;

  @override
  CameraController? get currentController => _controller;

  @override
  CameraDescription? get currentCamera => _currentCamera;

  @override
  bool get isInitialized => _isInitialized && _controller?.value.isInitialized == true;

  @override
  bool get isRecording => _controller?.value.isRecordingVideo ?? false;

  @override
  FlashMode get currentFlashMode => _controller?.value.flashMode ?? FlashMode.auto;

  @override
  double get currentZoomLevel {
    // Return the internally tracked zoom level
    return _currentZoomLevel;
  }

  @override
  double get maxZoomLevel {
    // Use the predefined max zoom level from app constants
    return AppConstants.maxZoomLevel;
  }

  @override
  double get minZoomLevel {
    // Use the predefined min zoom level from app constants
    return AppConstants.minZoomLevel;
  }

  @override
  Future<void> initialize() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isNotEmpty) {
        _currentCamera = _cameras[_currentCameraIndex];
        await _initializeController();
        _isInitialized = true;
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
      rethrow;
    }
  }

  @override
  Future<void> dispose() async {
    await _controller?.dispose();
    _controller = null;
    _isInitialized = false;
  }

  @override
  Future<List<CameraDescription>> getAvailableCameras() async {
    return _cameras;
  }

  @override
  Future<CameraController?> createController(CameraDescription camera) async {
    await _controller?.dispose();

    _controller = CameraController(camera, ResolutionPreset.high, enableAudio: false, imageFormatGroup: ImageFormatGroup.jpeg);

    await _controller!.initialize();
    return _controller;
  }

  @override
  Future<PhotoModel> takePicture(CameraController controller) async {
    if (!controller.value.isInitialized) {
      throw Exception('Camera not initialized');
    }

    try {
      final XFile image = await controller.takePicture();
      final File imageFile = File(image.path);

      // Get image metadata
      final metadata = await _extractMetadata(imageFile);

      // Create photo model
      final photo = PhotoModel(id: DateTime.now().millisecondsSinceEpoch.toString(), filePath: image.path, capturedAt: DateTime.now(), metadata: metadata, fileSizeBytes: await imageFile.length(), mimeType: 'image/jpeg');

      return photo;
    } catch (e) {
      debugPrint('Error taking picture: $e');
      rethrow;
    }
  }

  @override
  Future<void> switchCamera() async {
    if (_cameras.length <= 1) return;

    _currentCameraIndex = (_currentCameraIndex + 1) % _cameras.length;
    _currentCamera = _cameras[_currentCameraIndex];

    await _initializeController();
  }

  @override
  Future<void> setFlashMode(FlashMode mode) async {
    await _controller?.setFlashMode(mode);
  }

  @override
  Future<void> setFocusMode(FocusMode mode) async {
    await _controller?.setFocusMode(mode);
  }

  @override
  Future<void> setExposureMode(ExposureMode mode) async {
    await _controller?.setExposureMode(mode);
  }

  @override
  Future<void> setZoomLevel(double zoom) async {
    if (_controller != null) {
      final clampedZoom = zoom.clamp(minZoomLevel, maxZoomLevel);
      await _controller!.setZoomLevel(clampedZoom);
      // Update our internal tracking
      _currentZoomLevel = clampedZoom;
    }
  }

  Future<void> _initializeController() async {
    if (_currentCamera == null) return;

    await _controller?.dispose();

    _controller = CameraController(_currentCamera!, ResolutionPreset.high, enableAudio: false, imageFormatGroup: ImageFormatGroup.jpeg);

    await _controller!.initialize();

    // Reset zoom level to default when initializing a new controller
    _currentZoomLevel = AppConstants.defaultZoomLevel;
  }

  Future<PhotoMetadata> _extractMetadata(File imageFile) async {
    // This is a simplified metadata extraction
    // In a real implementation, you would use packages like exif to extract EXIF data

    final stat = await imageFile.stat();

    return PhotoMetadata(
      width: 1920, // Default values - should be extracted from actual image
      height: 1080,
      deviceModel: 'Unknown',
      exifData: {'fileSize': stat.size, 'modified': stat.modified.toIso8601String()},
    );
  }
}
