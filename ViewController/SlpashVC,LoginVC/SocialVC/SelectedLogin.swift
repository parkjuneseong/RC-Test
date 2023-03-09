//
//  SelectedLogin.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/09.
//

import UIKit
//let vc = UINavigationController(rootViewController: RegistVC())
//vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
//self.present(vc, animated: true)

class SelectedLogin: UIViewController {
    
    @IBAction func moveSginVC(_ sender: Any) {
        print("click")
          
        self.dismiss(animated: true) {
        let vc = UINavigationController(rootViewController: SginVC())
             
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //        vc = UINavigationController(rootViewController: SginVC())
        //        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.dismissTimeOut(sender:)), userInfo: nil, repeats: false)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @objc
    func dismissTimeOut(sender : Timer) {
        //            UIApplication.shared.windows.first?.rootViewController = vc
    }
}
