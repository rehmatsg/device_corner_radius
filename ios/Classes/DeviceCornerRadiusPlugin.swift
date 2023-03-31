import Flutter
import UIKit

public class DeviceCornerRadiusPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_corner_radius", binaryMessenger: registrar.messenger())
    let instance = DeviceCornerRadiusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getCornerRadius" {
      let cornerRadius = Float(UIScreen.main.displayCornerRadius)
      result([
        "topLeft": cornerRadius,
        "topRight": cornerRadius,
        "bottomLeft": cornerRadius,
        "bottomRight": cornerRadius
      ])
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}

/// Credits: @kylebshr/ScreenCorners (https://github.com/kylebshr/ScreenCorners)
/// This code snippet has been taken from the above repository without any modifications.
extension UIScreen {
  private static let cornerRadiusKey: String = {
    let components = ["Radius", "Corner", "display", "_"]
    return components.reversed().joined()
  } ()

  public var displayCornerRadius: CGFloat {
    guard let cornerRadius = self.value(forKey: Self.cornerRadiusKey) as? CGFloat else {
      assertionFailure("Failed to detect screen corner radius")
      return 0
    }
    return cornerRadius
  }
}