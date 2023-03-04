//
//  AppDelegate.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       window = UIWindow(frame: UIScreen.main.bounds)
       window?.rootViewController =  UINavigationController(rootViewController: HomeVC())
       window?.makeKeyAndVisible()
       return true
   }
}
