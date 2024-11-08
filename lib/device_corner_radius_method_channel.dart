import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'device_corner_radius_platform_interface.dart';

/// An implementation of [DeviceCornerRadiusPlatform] that uses method channels.
class MethodChannelDeviceCornerRadius extends DeviceCornerRadiusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_corner_radius');

  @override
  Future<BorderRadius> getCornerRadius() async {
    final radii = await methodChannel.invokeMethod('getCornerRadius');
    try {
      radii as Map;
      return BorderRadius.only(
        topLeft: Radius.circular(_asDouble(radii['topLeft'])),
        topRight: Radius.circular(_asDouble(radii['topRight'])),
        bottomLeft: Radius.circular(_asDouble(radii['bottomLeft'])),
        bottomRight: Radius.circular(_asDouble(radii['bottomRight'])),
      );
    } catch (e) {
      throw Exception('Failed to parse radii ');
    }
  }
}

double _asDouble(dynamic value) {
  if (value is double) {
    return value;
  } else if (value is int) {
    return value.toDouble();
  } else if (value is num) {
    return value.toDouble();
  } else if (value is String) {
    return double.parse(value.trim());
  } else {
    throw FormatException("value $value could not be mapped to double");
  }
}
