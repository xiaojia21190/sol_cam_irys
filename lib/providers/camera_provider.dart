import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:camera/camera.dart';
import '../models/photo_model.dart';
import 'app_state_provider.dart';

part 'camera_provider.g.dart';

@riverpod
class CameraState extends _$CameraState {
  @override
  CameraStateModel build() {
    return const CameraStateModel();
  }

  Future<void> initialize() async {
    try {
      state = state.copyWith(status: CameraStatus.initializing);

      final cameraService = ref.read(cameraServiceProvider);
      await cameraService.initialize();

      if (cameraService.isInitialized) {
        final cameras = await cameraService.getAvailableCameras();
        state = state.copyWith(status: CameraStatus.ready, controller: cameraService.currentController, currentCamera: cameraService.currentCamera, availableCameras: cameras);
      } else {
        state = state.copyWith(status: CameraStatus.error, errorMessage: 'Failed to initialize camera');
      }
    } catch (e) {
      state = state.copyWith(status: CameraStatus.error, errorMessage: 'Camera initialization error: $e');
    }
  }

  Future<void> dispose() async {
    final cameraService = ref.read(cameraServiceProvider);
    await cameraService.dispose();
    state = const CameraStateModel();
  }

  Future<PhotoModel?> takePicture() async {
    try {
      if (state.controller == null || !state.isReady) {
        throw Exception('Camera not ready');
      }

      state = state.copyWith(status: CameraStatus.capturing);

      final cameraService = ref.read(cameraServiceProvider);
      final photo = await cameraService.takePicture(state.controller!);

      // Add photo to app state
      ref.read(appStateProvider.notifier).addPhoto(photo);

      state = state.copyWith(status: CameraStatus.ready);

      return photo;
    } catch (e) {
      state = state.copyWith(status: CameraStatus.error, errorMessage: 'Failed to take picture: $e');
      return null;
    }
  }

  Future<void> switchCamera() async {
    try {
      if (state.availableCameras.length <= 1) return;

      state = state.copyWith(status: CameraStatus.switching);

      final cameraService = ref.read(cameraServiceProvider);
      await cameraService.switchCamera();

      state = state.copyWith(status: CameraStatus.ready, controller: cameraService.currentController, currentCamera: cameraService.currentCamera);
    } catch (e) {
      state = state.copyWith(status: CameraStatus.error, errorMessage: 'Failed to switch camera: $e');
    }
  }

  Future<void> setFlashMode(FlashMode mode) async {
    try {
      final cameraService = ref.read(cameraServiceProvider);
      await cameraService.setFlashMode(mode);

      state = state.copyWith(flashMode: mode);
    } catch (e) {
      state = state.copyWith(status: CameraStatus.error, errorMessage: 'Failed to set flash mode: $e');
    }
  }

  Future<void> setZoomLevel(double zoom) async {
    try {
      final cameraService = ref.read(cameraServiceProvider);
      await cameraService.setZoomLevel(zoom);

      state = state.copyWith(zoomLevel: zoom);
    } catch (e) {
      state = state.copyWith(status: CameraStatus.error, errorMessage: 'Failed to set zoom level: $e');
    }
  }

  void clearError() {
    state = state.copyWith(status: CameraStatus.ready, errorMessage: null);
  }
}

// Camera state model
class CameraStateModel {
  final CameraStatus status;
  final CameraController? controller;
  final CameraDescription? currentCamera;
  final List<CameraDescription> availableCameras;
  final FlashMode flashMode;
  final double zoomLevel;
  final String? errorMessage;

  const CameraStateModel({this.status = CameraStatus.uninitialized, this.controller, this.currentCamera, this.availableCameras = const [], this.flashMode = FlashMode.auto, this.zoomLevel = 1.0, this.errorMessage});

  CameraStateModel copyWith({CameraStatus? status, CameraController? controller, CameraDescription? currentCamera, List<CameraDescription>? availableCameras, FlashMode? flashMode, double? zoomLevel, String? errorMessage}) {
    return CameraStateModel(
      status: status ?? this.status,
      controller: controller ?? this.controller,
      currentCamera: currentCamera ?? this.currentCamera,
      availableCameras: availableCameras ?? this.availableCameras,
      flashMode: flashMode ?? this.flashMode,
      zoomLevel: zoomLevel ?? this.zoomLevel,
      errorMessage: errorMessage,
    );
  }

  bool get isReady => status == CameraStatus.ready && controller?.value.isInitialized == true;
  bool get isLoading => status == CameraStatus.initializing || status == CameraStatus.switching;
  bool get hasError => status == CameraStatus.error;
  bool get isCapturing => status == CameraStatus.capturing;
  bool get canSwitchCamera => availableCameras.length > 1;
}

enum CameraStatus { uninitialized, initializing, ready, capturing, switching, error }

// Camera settings provider
@riverpod
class CameraSettings extends _$CameraSettings {
  @override
  CameraSettingsModel build() {
    return const CameraSettingsModel();
  }

  void setGridLines(bool enabled) {
    state = state.copyWith(showGridLines: enabled);
  }

  void setTimer(CameraTimer timer) {
    state = state.copyWith(timer: timer);
  }

  void setAspectRatio(CameraAspectRatio ratio) {
    state = state.copyWith(aspectRatio: ratio);
  }

  void setHDR(bool enabled) {
    state = state.copyWith(hdrEnabled: enabled);
  }
}

class CameraSettingsModel {
  final bool showGridLines;
  final CameraTimer timer;
  final CameraAspectRatio aspectRatio;
  final bool hdrEnabled;

  const CameraSettingsModel({this.showGridLines = false, this.timer = CameraTimer.off, this.aspectRatio = CameraAspectRatio.ratio16_9, this.hdrEnabled = false});

  CameraSettingsModel copyWith({bool? showGridLines, CameraTimer? timer, CameraAspectRatio? aspectRatio, bool? hdrEnabled}) {
    return CameraSettingsModel(showGridLines: showGridLines ?? this.showGridLines, timer: timer ?? this.timer, aspectRatio: aspectRatio ?? this.aspectRatio, hdrEnabled: hdrEnabled ?? this.hdrEnabled);
  }
}

enum CameraTimer { off, three, ten }

enum CameraAspectRatio { ratio1_1, ratio4_3, ratio16_9 }

extension CameraTimerExtension on CameraTimer {
  int get seconds {
    switch (this) {
      case CameraTimer.off:
        return 0;
      case CameraTimer.three:
        return 3;
      case CameraTimer.ten:
        return 10;
    }
  }

  String get displayName {
    switch (this) {
      case CameraTimer.off:
        return 'Off';
      case CameraTimer.three:
        return '3s';
      case CameraTimer.ten:
        return '10s';
    }
  }
}

extension CameraAspectRatioExtension on CameraAspectRatio {
  double get ratio {
    switch (this) {
      case CameraAspectRatio.ratio1_1:
        return 1.0;
      case CameraAspectRatio.ratio4_3:
        return 4.0 / 3.0;
      case CameraAspectRatio.ratio16_9:
        return 16.0 / 9.0;
    }
  }

  String get displayName {
    switch (this) {
      case CameraAspectRatio.ratio1_1:
        return '1:1';
      case CameraAspectRatio.ratio4_3:
        return '4:3';
      case CameraAspectRatio.ratio16_9:
        return '16:9';
    }
  }
}
