
import 'dart:io';

import 'flutter_automatic_time_platform_interface.dart';

class FlutterAutomaticTime {
  Future<bool?> isAutomaticTime() {
    if (Platform.isAndroid){
      return FlutterAutomaticTimePlatform.instance.isAutomaticTime();
    }else{
      return Future.value(true);
    }
  }
}
