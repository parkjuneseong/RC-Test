//
//  JoinVc.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/12.
//

import UIKit

class JoinVc: UIViewController {
    var signModel : SignModel?
    @IBOutlet weak var nametextField: UITextField!
    
    @IBOutlet weak var nicknametextField: UITextField!
    @IBOutlet weak var emailtextField: UITextField!
    
    
    @IBOutlet weak var passwordtextField: UITextField!
    
    @IBOutlet weak var phonetextField: UITextField!
    
    func signPost(){
        if nametextField.text?.isEmpty ?? true && nicknametextField.text?.isEmpty ?? true && emailtextField.text?.isEmpty ?? true && passwordtextField.text?.isEmpty ?? true && phonetextField.text?.isEmpty ?? true {
            showToast(message: "모든 항목을 입력해주세요")
        } else {
            APIService.shared.postSign(param: ["name": "\(nametextField.text ?? "")" ,
                                               "userNickName": "\(nicknametextField.text ?? "")",
                                               "email": "\(emailtextField.text ?? "")",
                                               "password": "\(passwordtextField.text ?? "")",
                                               "phoneNum": "\(phonetextField.text ?? "")"]) {[weak self] model in
                showToast(message: model.message ?? "")
                if model.code == 1000 {
                    self?.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func joinBtn(_ sender: Any) {
        signPost()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
}
