import Flutter
import UIKit
import Foundation

@main
@objc class AppDelegate: FlutterAppDelegate {
  private var backHandlerChannel: FlutterMethodChannel?
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // Setup method channel for back button handling
    do {
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
      backHandlerChannel = FlutterMethodChannel(name: "com.ebidportal.auctions/back_handler",
                                              binaryMessenger: controller.binaryMessenger)
      
      print("iOS: Back handler method channel configured successfully")
      print("iOS: Running on iOS \(UIDevice.current.systemVersion)")
      print("iOS: Device model: \(UIDevice.current.model)")
      
      // Setup swipe gesture recognition for newer iOS versions
      if #available(iOS 13.0, *) {
        print("iOS: iOS 13+ detected, enhanced gesture handling available")
        setupModernGestureHandling()
      } else {
        print("iOS: iOS 12 or older detected, using basic setup")
      }
      
    } catch {
      print("iOS: Error setting up back handler method channel: \(error.localizedDescription)")
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  // Setup modern gesture handling for iOS 13+
  @available(iOS 13.0, *)
  private func setupModernGestureHandling() {
    print("iOS: Setting up modern gesture handling for iOS 13+")
    // Can be extended to handle specific iOS 13+ gestures or navigation patterns
  }
  
  // iOS doesn't have a hardware back button, but we can handle swipe gestures
  // This is mainly for consistency with Android implementation
  func handleBackAction() {
    print("iOS: Back action triggered")
    
    guard let channel = backHandlerChannel else {
      print("iOS: Method channel not available")
      return
    }
    
    channel.invokeMethod("onBackPressed", arguments: nil) { result in
      if let error = result as? FlutterError {
        print("iOS: Back handler error: \(error.message ?? "Unknown error")")
      } else {
        print("iOS: Back handler method called successfully")
      }
    }
  }
}")
      } else {
        print("iOS: Back handler completed successfully")
      }
    }
  }
}
