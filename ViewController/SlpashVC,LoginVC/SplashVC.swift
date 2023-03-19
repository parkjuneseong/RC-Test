//
//  SplashVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/06.
//

import UIKit

class SplashVC: UIViewController {
 
        var vc: UINavigationController?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let userId = UserDefaults.standard.string(forKey: "userId")
            let jwt = UserDefaults.standard.string(forKey: "jwt")
            
            //자동로그인
            if userId != nil && jwt != nil {
                vc = UINavigationController(rootViewController: RootViewController())
            } else {
                vc = UINavigationController(rootViewController: SocialVc())
            }
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
            
        }
        
        @objc
        func splashTimeOut(sender : Timer) {
            UIApplication.shared.windows.first?.rootViewController = vc
        }
    }
