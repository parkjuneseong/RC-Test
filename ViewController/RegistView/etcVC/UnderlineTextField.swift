//
//  UnderlineTextField.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/08.
//

import UIKit

class UnderlineTextField: UIView {
  
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var underlineView: UIView!
    
    @IBOutlet weak var textField: UITextField!
    private var containerView = UIView()
    
    private var nibName: String {
        "\(UnderlineTextField.self)"
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
    }
}

extension UnderlineTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        underlineView.backgroundColor = .black
        textField.textColor = .black
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        underlineView.backgroundColor = .black
        textField.textColor = .black
    }
}
