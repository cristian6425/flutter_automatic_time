import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_automatic_time_method_channel.dart';

abstract class FlutterAutomaticTimePlatform extends PlatformInterface {
  /// Constructs a FlutterAutomaticTimePlatform.
  FlutterAutomaticTimePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAutomaticTimePlatform _instance = MethodChannelFlutterAutomaticTime();

  /// The default instance of [FlutterAutomaticTimePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAutomaticTime].
  static FlutterAutomaticTimePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAutomaticTimePlatform] when
  /// they register themselves.
  static set instance(FlutterAutomaticTimePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> isAutomaticTime();
}
