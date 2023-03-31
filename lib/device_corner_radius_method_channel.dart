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
        topLeft: Radius.circular(radii['topLeft'] as double),
        topRight: Radius.circular(radii['topRight'] as double),
        bottomLeft: Radius.circular(radii['bottomLeft'] as double),
        bottomRight: Radius.circular(radii['bottomRight'] as double),
      );
    } catch (e) {
      throw Exception('Failed to parse radii ');
    }
  }
  
}
