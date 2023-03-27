import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_corner_radius/device_corner_radius_method_channel.dart';

void main() {
  MethodChannelDeviceCornerRadius platform = MethodChannelDeviceCornerRadius();
  const MethodChannel channel = MethodChannel('device_corner_radius');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
