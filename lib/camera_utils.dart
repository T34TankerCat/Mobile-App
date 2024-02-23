// camera_utils.dart
import 'package:camera/camera.dart';

class CameraUtils {
  static List<CameraDescription> cameras = [];

  static Future<void> initializeCameras() async {
    cameras = await availableCameras();
  }
}
