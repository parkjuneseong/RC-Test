//
//  SginVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/06.
//

import UIKit

class SginVC: UIViewController {
   
    @IBAction func moveRootVC(_ sender: Any) {
        let vc = RootViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameContainer: UIView!
    @IBOutlet weak var birthContainer: UIView!
    
    @IBOutlet weak var lgContainer: UIView!
    
    @IBOutlet weak var numberContainer: UIView!
    
    @IBOutlet weak var numberTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var lgTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var birthTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var numberHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lgHeightConstraint: NSLayoutConstraint!
     
    @IBOutlet weak var birthHeightConstraint: NSLayoutConstraint!
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.dismiss(animated: false)
    }
    
    private var nameTextField: SginTextField?
    private var birthTextField :BirthTextField?
    private var lgTextField : LGTextField?
    private var numberTextField : NumberTextField?
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField = SginTextField(frame: .zero)
        nameTextField?.textField.placeholder = ""
        nameTextField?.titleLabel.text = "이름"
        nameTextField?.textField.addTarget(self, action: #selector(nameContainerDidChange(_:)), for: .editingChanged)
        birthTextField = BirthTextField(frame: .zero)
        birthTextField?.textField.placeholder = "예시"
        birthTextField?.textField2.placeholder = ""
        birthTextField?.titleLabel.text = "생년월일"
        birthTextField?.backLabel.text = "000000"
        birthTextField?.textField2.addTarget(self, action: #selector(bitrhContainerDidChange(_:)), for: .editingChanged)
        lgTextField = LGTextField(frame:  .zero)
        lgTextField?.textField.placeholder = "통신사"
        lgTextField?.textField.addTarget(self, action: #selector(lgContainerDidChange(_:)), for: .editingChanged)
        numberTextField = NumberTextField(frame: .zero)
        numberTextField?.textField.placeholder = "01012345678"
        numberTextField?.titleLabel.text = "휴대폰번호"
        numberTextField?.textField.addTarget(self, action: #selector(numberContainerDidChange(_:)), for: .editingChanged)
         
        if let nameTextField = nameTextField{
            nameTextField.translatesAutoresizingMaskIntoConstraints = false
            nameContainer.addSubview(nameTextField)
            nameContainer.addConstraints([
                nameTextField.leadingAnchor.constraint(equalTo: nameContainer.leadingAnchor),
                nameTextField.trailingAnchor.constraint(equalTo: nameContainer.trailingAnchor),
                nameTextField.topAnchor.constraint(equalTo: nameContainer.topAnchor),
                nameTextField.bottomAnchor.constraint(equalTo: nameContainer.bottomAnchor)
            ])
        }
        if let birthTextField = birthTextField{
            birthTextField.translatesAutoresizingMaskIntoConstraints = false
            birthContainer.addSubview(birthTextField)
            birthContainer.addConstraints([
                birthTextField.leadingAnchor.constraint(equalTo: birthContainer.leadingAnchor),
                birthTextField.trailingAnchor.constraint(equalTo: birthContainer.trailingAnchor),
                birthTextField.topAnchor.constraint(equalTo: birthContainer.topAnchor),
                birthTextField.bottomAnchor.constraint(equalTo: birthContainer.bottomAnchor)
            ])
        }
        if let lgTextField = lgTextField{
            lgTextField.translatesAutoresizingMaskIntoConstraints = false
            lgContainer.addSubview(lgTextField)
            lgContainer.addConstraints([
                lgTextField.leadingAnchor.constraint(equalTo: lgContainer.leadingAnchor),
                lgTextField.trailingAnchor.constraint(equalTo: lgContainer.trailingAnchor),
                lgTextField.topAnchor.constraint(equalTo: lgContainer.topAnchor),
                lgTextField.bottomAnchor.constraint(equalTo: lgContainer.bottomAnchor)
            ])
        }
        if let numberTextField = numberTextField{
            numberTextField.translatesAutoresizingMaskIntoConstraints = false
            numberContainer.addSubview(numberTextField)
            numberContainer.addConstraints([
                numberTextField.leadingAnchor.constraint(equalTo: numberContainer.leadingAnchor),
                numberTextField.trailingAnchor.constraint(equalTo: numberContainer.trailingAnchor),
                numberTextField.topAnchor.constraint(equalTo: numberContainer.topAnchor),
                numberTextField.bottomAnchor.constraint(equalTo: numberContainer.bottomAnchor)
            ])
        }
        
         
    }
    
    
    
    @objc func nameContainerDidChange(_ sender: Any?) {
        if nameTextField?.textField.text?.count ?? 0 > 3 {
            titleLabel.text = "생년월일을\n입력해주세요"
            UIView.animate(withDuration: 1, delay: 0, animations: {
                self.birthTopConstraint.constant = 20
                self.birthHeightConstraint.constant = 45
                self.birthContainer.isHidden = false
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func bitrhContainerDidChange(_ sender: Any?) {
        if birthTextField?.textField2.text?.count ?? 0 > 0 && birthTextField?.textField.text?.count ?? 0 > 5 {
            titleLabel.text = "통신사를\n선택해주세요"
            UIView.animate(withDuration: 1, delay: 0, animations: {
                self.lgTopConstraint.constant = 20
                self.lgHeightConstraint.constant = 40
                self.lgContainer.isHidden = false
                self.view.layoutIfNeeded()
            })
        }
    }
    @objc func lgContainerDidChange(_ sender: Any?) {
        if lgTextField?.textField.text?.count ?? 0 > 4{
            titleLabel.text = "휴대폰번호를\n입력해주세요"
            UIView.animate(withDuration: 1, delay: 0, animations: {
                self.numberTopConstraint.constant = 20
                self.numberHeightConstraint.constant = 40
                self.numberContainer.isHidden = false
                self.view.layoutIfNeeded()
            })
        }
    }
    @objc func numberContainerDidChange(_ sender: Any?) {
        if numberTextField?.textField.text?.count ?? 0 > 10{
            titleLabel.text = "입력한 정보를\n확인해주세요"
            UIView.animate(withDuration: 1, delay: 0, animations: {
                self.resultView.isHidden = false
                self.view.layoutIfNeeded()
            })
        }
    }
}
