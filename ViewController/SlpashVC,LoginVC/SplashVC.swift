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
            
//            let user = UserDefaultsManager.shared.getUser()
            
//            if user != nil {
                vc = UINavigationController(rootViewController: SocialVc())
//            } else {
//                vc = UINavigationController(rootViewController: LoginVC(isShowAlert: true))
//            }

            
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
            
        }
        
        @objc
        func splashTimeOut(sender : Timer) {
            UIApplication.shared.windows.first?.rootViewController = vc
        }
    }
