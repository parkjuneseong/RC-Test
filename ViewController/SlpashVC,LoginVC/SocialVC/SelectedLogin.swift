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

protocol SelectedLoginDelegate: AnyObject {
    func moveSignVCAction()
}

class SelectedLogin: UIViewController {
    weak var delegate: SelectedLoginDelegate?
    
    @IBAction func moveSginVC(_ sender: Any) {
        print("click")
          
        self.dismiss(animated: true) {
            self.delegate?.moveSignVCAction()
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
