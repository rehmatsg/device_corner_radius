import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_corner_radius/device_corner_radius_platform_interface.dart';
import 'package:device_corner_radius/device_corner_radius_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceCornerRadiusPlatform with MockPlatformInterfaceMixin implements DeviceCornerRadiusPlatform {
  
  @override
  Future<BorderRadius> getCornerRadius() {
    throw UnimplementedError();
  }

}

void main() {
  final DeviceCornerRadiusPlatform initialPlatform = DeviceCornerRadiusPlatform.instance;

  test('$MethodChannelDeviceCornerRadius is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceCornerRadius>());
  });
}
