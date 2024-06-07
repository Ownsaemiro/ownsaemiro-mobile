import UIKit
import Flutter
import NaverThirdPartyLogin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      NaverThirdPartyLoginConnection.getSharedInstance()?.isNaverAppOauthEnable = true
      NaverThirdPartyLoginConnection.getSharedInstance()?.isInAppOauthEnable = true
      
      
      let thirdConn = NaverThirdPartyLoginConnection.getSharedInstance()
//      thirdConn?.serviceUrlScheme = kServiceAppUrlScheme
//      thirdConn?.consumerKey = kConsumerKey
//      thirdConn?.consumerSecret = kConsumerSecret
//      thirdConn?.appName = kServiceAppName
      thirdConn?.serviceUrlScheme="ownsaemirourlscheme"
      thirdConn?.consumerKey="X5Tnrn15UA2KjNC86fa3"
      thirdConn?.consumerSecret="8kfDxJM9Ph"
      thirdConn?.appName="Ownsaemiro"
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        var applicationResult = false
        if (!applicationResult) {
           applicationResult = NaverThirdPartyLoginConnection.getSharedInstance().application(app, open: url, options: options)
        }
        // if you use other application url process, please add code here.
        
        if (!applicationResult) {
           applicationResult = super.application(app, open: url, options: options)
        }
        return applicationResult
    }
}
