//
//  RegistVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//

import UIKit

class RegistVC: UIViewController {

    @IBOutlet weak var registBtn: UIControl!
    @IBOutlet weak var backButton: UIControl!
     
    
    @IBOutlet weak var textField1Container: UIView!
    
    @IBOutlet weak var textField2Container: UIView!
   
    @IBOutlet weak var category: UIControl!
    
    
    @IBOutlet weak var tag: UIControl!
    
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func categoryBtn(_ sender: Any) {
        let vc1 = CategoryVC()
        self.navigationController?.pushViewController(vc1, animated: true)
    }
    
    
    @IBAction func tagBtn(_ sender: Any) {
        let vc2 = TagVC()
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    
    
    
    @IBAction func backBtnAction(_ sender: Any) {
         let vc = RootViewController()
        self.dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
 
        myLabel.text = "-구매 시기\n\n-브랜드/모델명\n\n제품의 상태(사용감,하자 유무 등)\n\n* 서로가 믿고 거래할 수 있도록,자세한 정보와 다양한\n\n각도의 상품 사진을 올려주세요."
        
        let underlineTextField = UnderlineTextField(frame: .zero)
        underlineTextField.textField.placeholder = "상품명"
        underlineTextField.price.isHidden = true
        underlineTextField.checkImage.isHidden = true
        underlineTextField.translatesAutoresizingMaskIntoConstraints = false
        textField1Container.addSubview(underlineTextField)
        textField1Container.addConstraints([
            underlineTextField.leadingAnchor.constraint(equalTo: textField1Container.leadingAnchor),
            underlineTextField.trailingAnchor.constraint(equalTo: textField1Container.trailingAnchor),
            underlineTextField.topAnchor.constraint(equalTo: textField1Container.topAnchor),
            underlineTextField.bottomAnchor.constraint(equalTo: textField1Container.bottomAnchor)
        ])
        
        
        let underlineTextField2 = UnderlineTextField(frame: .zero)
        underlineTextField2.textField.placeholder = "￦ 가격"
        underlineTextField2.price.text = "배송비포함"
        underlineTextField2.checkImage.image = UIImage(named:"whiteCheck")
        underlineTextField2.translatesAutoresizingMaskIntoConstraints = false
         
        textField2Container.addSubview(underlineTextField2)
        textField2Container.addConstraints([
            underlineTextField2.leadingAnchor.constraint(equalTo: textField2Container.leadingAnchor),
            underlineTextField2.trailingAnchor.constraint(equalTo: textField2Container.trailingAnchor),
            underlineTextField2.topAnchor.constraint(equalTo: textField2Container.topAnchor),
            underlineTextField2.bottomAnchor.constraint(equalTo: textField2Container.bottomAnchor)
        ])
    }
   
}
