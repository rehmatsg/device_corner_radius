
import 'device_corner_radius_platform_interface.dart';

class DeviceCornerRadius {
  Future<String?> getPlatformVersion() {
    return DeviceCornerRadiusPlatform.instance.getPlatformVersion();
  }
}
