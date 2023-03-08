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
        guard let pvc = self.presentingViewController else { return }

        self.dismiss(animated: true) {
            let vc = UINavigationController(rootViewController: SginVC())
            vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
          pvc.present(vc, animated: true, completion: nil)
             
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
