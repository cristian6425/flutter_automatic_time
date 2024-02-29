import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_automatic_time/flutter_automatic_time.dart';
import 'package:flutter_automatic_time/flutter_automatic_time_platform_interface.dart';
import 'package:flutter_automatic_time/flutter_automatic_time_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAutomaticTimePlatform
    with MockPlatformInterfaceMixin
    implements FlutterAutomaticTimePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterAutomaticTimePlatform initialPlatform = FlutterAutomaticTimePlatform.instance;

  test('$MethodChannelFlutterAutomaticTime is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAutomaticTime>());
  });

  test('getPlatformVersion', () async {
    FlutterAutomaticTime flutterAutomaticTimePlugin = FlutterAutomaticTime();
    MockFlutterAutomaticTimePlatform fakePlatform = MockFlutterAutomaticTimePlatform();
    FlutterAutomaticTimePlatform.instance = fakePlatform;

    expect(await flutterAutomaticTimePlugin.getPlatformVersion(), '42');
  });
}
