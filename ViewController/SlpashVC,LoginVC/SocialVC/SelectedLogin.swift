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

protocol JoinDelegate: AnyObject {
    func moveJoin()
}
protocol LoginDelegate : AnyObject {
    func moveLogin()
}
class SelectedLogin: UIViewController {
    weak var delegate: SelectedLoginDelegate?
    weak var loginDelegate : LoginDelegate?
    weak var joinDelegate : JoinDelegate?
    
    @IBAction func moveJoin(_ sender: Any) {
        self.dismiss(animated: true){
            self.joinDelegate?.moveJoin()
        }
    }
    @IBAction func moveLogin(_ sender: Any) {
        print("click")
        self.dismiss(animated: true) {
            self.loginDelegate?.moveLogin()
           
        }
    }
    
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
    
}
