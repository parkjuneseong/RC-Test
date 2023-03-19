//
//  AppDelegate.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       FirebaseApp.configure()
       
       window = UIWindow(frame: UIScreen.main.bounds)
       let rootViewController = SplashVC()
        
       window?.rootViewController = rootViewController
       window?.makeKeyAndVisible()
       return true
   }
}
