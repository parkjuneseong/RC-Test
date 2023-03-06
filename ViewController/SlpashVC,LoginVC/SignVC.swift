//
//  SignVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/06.
//

import UIKit

class SignVC: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.borderStyle = .none
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 30))

        // set the border style to none
        textField.borderStyle = .none

        // create a new layer for the underline
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - borderWidth, width: textField.frame.size.width, height: textField.frame.size.height)

        border.borderWidth = borderWidth
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
        textField.text = "이름을 입력해세요"
        
    }
}
