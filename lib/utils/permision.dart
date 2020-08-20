import 'package:permission_handler/permission_handler.dart';

class PermissionFun {
  Future storagePermision() async {
    var status = await Permission.storage.status;
    if (status.isGranted == false) {
      var statuses = await [
        Permission.storage,
      ].request();
      status = statuses[Permission.storage];
    }
    return status;
  }

  Future cameraPermision() async {
    var status = await Permission.camera.status;
    if (status.isGranted == false) {
      var statuses = await [
        Permission.camera,
      ].request();
      status = statuses[Permission.camera];
    }
    return status;
  }

  Future micPermision() async {
    var status = await Permission.microphone.status;
    if (status.isGranted == false) {
      var statuses = await [
        Permission.microphone,
      ].request();
      status = statuses[Permission.microphone];
    }
    return status;
  }
}
