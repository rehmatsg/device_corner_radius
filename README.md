# Device Corner Radius

This plugin uses native APIs to get the corner radius of the device.

For Android, it uses the `WindowInsets` API released along Android S.
> Note: The `WindowInsets` API is only available on Android S (API 31) and above.
> Read more about the API [here](https://developer.android.com/develop/ui/views/theming/rounded-corners)

For iOS, it read private `_displayCornerRadius` property of `UIScreen` class.
> The Swift code used in this package was taken directly from [@kylebshr's ScreenCorners](https://github.com/kylebshr/ScreenCorners)

## Usage

Import the package:

```dart
import 'package:device_corner_radius/device_corner_radius.dart';
```

And then use the `getDeviceCornerRadius()` method:

```dart
BorderRadius cornerRadius = await DeviceCornerRadius.getCornerRadius();
```

## Reported Values for Apple Devices (by [@kylebshr](https://github.com/kylebshr))

| Device | Value (pts) |
|--|--|
| iPhone 14 Pro / 14 Pro Max | 55.0 |
| iPhone 13 Pro Max / 14 Plus / 12 Pro Max | 53.33 |
| iPhone 14 / 13 Pro / 12 Pro / 12 | 47.33 |
| iPhone 13 Mini / 12 Mini | 44.0 |
| iPhone 11 Pro / 11 Pro Max / X / XS / XS Max | 39.0 |
| iPhone XR / 11 | 41.5 |
| iPad Air / iPad Pro 11-inch / 12.9-inch | 18.0 |

## TODO

- Test on real Android devices

## Contributors

- [Rehmat Singh Gill](https://github.com/rehmatsg)

## Report Issues / Bugs

If you find any bugs or misplaced icons, please open an issue [here](https://github.com/rehmatsg/device_corner_radius/issues).

## License

This package is licensed under the [MIT License](https://github.com/rehmatsg/device_corner_radius/LICENSE)
