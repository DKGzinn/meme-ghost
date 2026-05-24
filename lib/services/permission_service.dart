import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class PermissionService {
  static Future<bool> requestOverlayPermission() async {
    bool status = await FlutterOverlayWindow.isPermissionGranted();
    if (!status) {
      status = await FlutterOverlayWindow.requestPermission() ?? false;
    }
    return status;
  }

  static Future<bool> requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    return status.isGranted;
  }

  static Future<bool> checkAllPermissions() async {
    bool overlay = await FlutterOverlayWindow.isPermissionGranted();
    return overlay;
  }
}
