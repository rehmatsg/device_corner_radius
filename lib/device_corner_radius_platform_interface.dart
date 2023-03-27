import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_corner_radius_method_channel.dart';

abstract class DeviceCornerRadiusPlatform extends PlatformInterface {
  /// Constructs a DeviceCornerRadiusPlatform.
  DeviceCornerRadiusPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceCornerRadiusPlatform _instance = MethodChannelDeviceCornerRadius();

  /// The default instance of [DeviceCornerRadiusPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceCornerRadius].
  static DeviceCornerRadiusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceCornerRadiusPlatform] when
  /// they register themselves.
  static set instance(DeviceCornerRadiusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
