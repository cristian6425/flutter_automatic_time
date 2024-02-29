import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_automatic_time_platform_interface.dart';

/// An implementation of [FlutterAutomaticTimePlatform] that uses method channels.
class MethodChannelFlutterAutomaticTime extends FlutterAutomaticTimePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_automatic_time');

  @override
  Future<bool?> isAutomaticTime() async {
    final version = await methodChannel.invokeMethod<bool?>('isAutomaticTime');
    return version;
  }
}
