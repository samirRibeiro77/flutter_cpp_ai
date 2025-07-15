import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController

    let mathChannel = FlutterMethodChannel(
        name: "com.samir_ribeiro.flutter_cpp_ai",
        binaryMessenger: controller.binaryMessenger
    )

    mathChannel.setMethodCallHandler { [weak self] (call, result) in
        guard let strongSelf = self else { return }

        print("Swift: Received method call: \(call,method)")

        if call.method == "add" {
            guard let args = call.arguments as? [String: Any],
                let x = args["x"] as? Int,
                let y = args["y"] as? Int else {
                    result(FlutterError(
                        code: "INVALID_ARGS",
                        message: "Invalid arguments",
                        details: "Expected integers for 'x' and 'y'"
                    ))
                    return
            }

            let sum = nativeAdd(Int32(x), Int32(y))
            result(sum)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
