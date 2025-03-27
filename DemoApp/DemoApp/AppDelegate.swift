//
//  AppDelegate.swift
//  DemoApp
//
//  Created by Thang Le on 11/03/2025.
//

import UIKit
import FirebaseCore
import FirebaseMessaging
import GapoSDK
import PushKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var voipRegistry: PKPushRegistry?
    
    func setupWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "ViewController")

        let navigationController = UINavigationController(rootViewController: rootVC)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        setupWindow()
        Messaging.messaging().delegate = self
        registerRemoteNotifications()
        registerVoipNotifications()
        setupUIAppearances()
        let colorConfig = GapoWorkColorConfig(
            primaryColor: "#0C4DA1",
            secondaryColor: "#0C4DA1",
            linkPrimaryColor: "#0C4DA1"
        )
        let config = GapoWorkConfig(
            appName: "iHaNoi",
            appScheme: "ihanoi",
            host: "gapowork.vn",
            hostPrefix: "ihanoi",
            language: "vi",
            environment: .staging,
            colorConfig: colorConfig
        )
        GapoWork.shared.setup(config: config)
        
        return true
    }
    
    func setupUIAppearances() {
        UITableViewCell.appearance().selectionStyle = .none
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
//        updateFCMTokenToSDK()
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func registerRemoteNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("✅ Quyền thông báo được cấp")
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                print("❌ Người dùng từ chối quyền thông báo")
            }
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let apnsToken = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        Messaging.messaging().apnsToken = deviceToken
        GapoWork.shared.setAPNsToken(apnsToken)
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed register token: \(error.localizedDescription)")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        guard let info = response.notification.request.content.userInfo as? [String: Any] else { return }
        if let from = info["from"] as? String, from == "gapo" {
            GapoWork.shared.handleNotification(info: info)
        }
    }
}

extension AppDelegate: MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        guard let fcmToken = fcmToken else { return }
        GapoWork.shared.setFcmToken(fcmToken)
    }
    
    func updateFCMTokenToSDK() {
        let current = UNUserNotificationCenter.current()
        current.getNotificationSettings(completionHandler: { (settings) in
            DispatchQueue.main.async {
                if settings.authorizationStatus != .denied {
                    Messaging.messaging().token { token, err in
                        if let token = token {
                            GapoWork.shared.setFcmToken(token)
                        }
                    }
                }
            }
        })
    }
}

extension AppDelegate: PKPushRegistryDelegate {
    
    func registerVoipNotifications() {
        let voipRegistry = PKPushRegistry(queue: DispatchQueue.main)
        voipRegistry.delegate = self
        voipRegistry.desiredPushTypes = [PKPushType.voIP]
        self.voipRegistry  = voipRegistry
    }
    
    func pushRegistry(_ registry: PKPushRegistry, didUpdate pushCredentials: PKPushCredentials, for type: PKPushType) {
        let token = pushCredentials.token.map { String(format: "%02x", $0) }.joined()
        print("pushRegistry voip token -> deviceToken :\(token)")
        GapoWork.shared.setVoipToken(token)
    }
    
    func pushRegistry(_ registry: PKPushRegistry, didInvalidatePushTokenFor type: PKPushType) {
        print("pushRegistry:didInvalidatePushTokenForType:")
    }
    
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        guard let data = payload.dictionaryPayload as? [String: Any] else { return }
        
        GapoWork.shared.showIncomingCall(payload: data, completion: completion)
    }
}

