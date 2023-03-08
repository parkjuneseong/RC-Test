//
//  BirthTextField.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/08.
//

import Foundation
import UIKit
class BirthTextField : UIView{
     
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var underlineView: UIView!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var underlineView2: UIView!
    @IBOutlet weak var backLabel: UILabel!
    private var containerView = UIView()
    
    private var nibName: String {
        "\(BirthTextField.self)"
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
   
    required init?  (coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
    
    private func loadNib() {
        guard let loadedNib = Bundle.main.loadNibNamed(nibName, owner: self, options: nil) else {
            return
        }
        containerView = loadedNib.first as? UIView ?? UIView()
        containerView.frame = bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(containerView)
        customViewDidLoad()
    }
    
    private func customViewDidLoad() {
        textField.delegate = self
        textField2.delegate = self
        
    }
}

extension BirthTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        underlineView.backgroundColor = .black
        underlineView2.backgroundColor = .black
        textField.textColor = .black
        textField2.textColor = .black
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        underlineView.backgroundColor = .black
        underlineView2.backgroundColor = .black
        textField.textColor = .black
        textField2.textColor = .black
        
    }
}
 
