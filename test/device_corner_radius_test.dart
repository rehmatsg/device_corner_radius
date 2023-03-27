import 'package:flutter_test/flutter_test.dart';
import 'package:device_corner_radius/device_corner_radius.dart';
import 'package:device_corner_radius/device_corner_radius_platform_interface.dart';
import 'package:device_corner_radius/device_corner_radius_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceCornerRadiusPlatform
    with MockPlatformInterfaceMixin
    implements DeviceCornerRadiusPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DeviceCornerRadiusPlatform initialPlatform = DeviceCornerRadiusPlatform.instance;

  test('$MethodChannelDeviceCornerRadius is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceCornerRadius>());
  });

  test('getPlatformVersion', () async {
    DeviceCornerRadius deviceCornerRadiusPlugin = DeviceCornerRadius();
    MockDeviceCornerRadiusPlatform fakePlatform = MockDeviceCornerRadiusPlatform();
    DeviceCornerRadiusPlatform.instance = fakePlatform;

    expect(await deviceCornerRadiusPlugin.getPlatformVersion(), '42');
  });
}
