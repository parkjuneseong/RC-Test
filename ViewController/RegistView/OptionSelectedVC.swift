//
//  OptionSelectedVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/14.
//

import UIKit

protocol OptionSelectedVCDelegate: AnyObject {
    func selectedOption(quantity: Int, productStatus: String, isChangable: String, location: String)
}

class OptionSelectedVC: UIViewController {
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var usedGoodsButton: UIControl!
    @IBOutlet weak var newGoodsButton: UIControl!
    @IBOutlet weak var usedGoodsLabel: UILabel!
    @IBOutlet weak var newGoodsLabel: UILabel!
    @IBOutlet weak var isChangableLabel: UILabel!
    @IBOutlet weak var isChangableControl: UIControl!
    @IBOutlet weak var isNotChangableControl: UIControl!
    @IBOutlet weak var isNotChangeableLabel: UILabel!
    @IBOutlet weak var locationTextField: UITextField!
    
    private var isUsedGoods = true
    private var isNotChangable = true
    
    weak var delegate: OptionSelectedVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func usedGoodsButtonAction(_ sender: Any) {
        isUsedGoods = true
        usedGoodsButton.backgroundColor = UIColor(named: "follow")
        newGoodsButton.backgroundColor = .systemBackground
        usedGoodsLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        usedGoodsLabel.textColor = .systemPink
        newGoodsLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        newGoodsLabel.textColor = .lightGray
    }
    
    @IBAction func newGoodsButtonAction(_ sender: Any) {
        isUsedGoods = false
        newGoodsButton.backgroundColor = UIColor(named: "follow")
        usedGoodsButton.backgroundColor = .systemBackground
        newGoodsLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        newGoodsLabel.textColor = .systemPink
        usedGoodsLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        usedGoodsLabel.textColor = .lightGray
    }
    @IBAction func isChangableButtonAction(_ sender: Any) {
        isNotChangable = false
        isChangableControl.backgroundColor = UIColor(named: "follow")
        isNotChangableControl.backgroundColor = .systemBackground
        isChangableLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        isChangableLabel.textColor = .systemPink
        isNotChangeableLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        isNotChangeableLabel.textColor = .lightGray
    }
    
    @IBAction func isNotChanableButtonAction(_ sender: Any) {
        isNotChangable = true
        isNotChangableControl.backgroundColor = UIColor(named: "follow")
        isChangableControl.backgroundColor = .systemBackground
        isNotChangeableLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        isNotChangeableLabel.textColor = .systemPink
        isChangableLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        isChangableLabel.textColor = .lightGray
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
        delegate?.selectedOption(quantity: Int("\(quantityTextField.text ?? "0")") ?? 0, productStatus: isUsedGoods ? "중고상품" : "새상품", isChangable: isNotChangable ? "불가" : "가능", location: locationTextField.text ?? "")
        self.dismiss(animated: true)
    }
}
