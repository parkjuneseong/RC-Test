//
//  LoginVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/06.
//
import Alamofire
import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var joinText : JoinVc?
    var loginModel : LoginModel?
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func loginBtn(_ sender: Any) {
     postLogin()
    }
    
    func postLogin(){
        if emailTextField.text?.isEmpty ?? true && passwordTextField.text?.isEmpty ?? true {
            showToast(message: "항목을 입력해주세요.")
        } else {
            APIService.shared.postLogin(param: ["email" : "\(emailTextField.text ?? "")","password" : "\(passwordTextField.text ?? "")"]) {[weak self] model in
                if model.code == 1000 {
                    showToast(message: model.message ?? "")
                    UserDefaults.standard.set(model.result?.userIdx, forKey: "userIdx")
                    UserDefaults.standard.set(model.result?.jwt, forKey: "jwt")
                    let vc = UINavigationController(rootViewController: RootViewController())
               
                 
                    vc.navigationBar.isHidden = true
                    UIApplication.shared.windows.first?.rootViewController = vc
                } else {
                    showToast(message: "로그인 실패")
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    let userDefualts = UserDefaults.standard
}
