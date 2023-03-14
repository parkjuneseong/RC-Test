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
            
            let userIdx = UserDefaults.standard.string(forKey: "userIdx")
            let jwt = UserDefaults.standard.string(forKey: "jwt")
            
            //자동로그인
            if userIdx != nil && jwt != nil {
                vc = UINavigationController(rootViewController: RootViewController())
//                print("\(jwt ?? "")")
            } else {
                vc = UINavigationController(rootViewController: SocialVc())
            }
            vc = UINavigationController(rootViewController: SocialVc())
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
            
        }
        
        @objc
        func splashTimeOut(sender : Timer) {
            UIApplication.shared.windows.first?.rootViewController = vc
        }
    }
