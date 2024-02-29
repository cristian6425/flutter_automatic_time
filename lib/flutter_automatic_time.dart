
import 'flutter_automatic_time_platform_interface.dart';

class FlutterAutomaticTime {
  Future<bool?> isAutomaticTime() {
    return FlutterAutomaticTimePlatform.instance.isAutomaticTime();
  }
}
