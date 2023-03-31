
import 'package:flutter/rendering.dart';

import 'device_corner_radius_platform_interface.dart';

class DeviceCornerRadius {

  /// Returns the corner radius of the device.
  /// Throws [Exception] if the there's an error
  /// Returns [BorderRadius.zero] if the device doesn't have a corner radius or if the device is not supported.
  static Future<BorderRadius> getCornerRadius() {
    return DeviceCornerRadiusPlatform.instance.getCornerRadius();
  }

}
