//
//  MyFourCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/07.
//

import UIKit

class MyFourCell: UITableViewCell {
 
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var selected1Label: UILabel!
    @IBOutlet weak var selected1: UIControl!
    @IBOutlet weak var textField: UITextField!
    private var myFiveCellPresneter = MyFiveCellPresneter()
    
    let fiveList = [
        ["image" : "sadImage" ,"label" : "판매중인 상품이 없습니다"],
        ["image" : "sadImage" ,"label" : "판매중인 상품이 없습니다"],
        ["image" : "sadImage" ,"label" : "판매중인 상품이 없습니다"],
        ["image" : "sadImage" ,"label" : "판매중인 상품이 없습니다"]
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(named:"showMore")
        setPresenterModel()
    }
    
    private func setPresenterModel() {
        myFiveCellPresneter.set(model: fiveList)
        
    }
    @IBAction func selected1(_ sender: Any) {
        selected1.backgroundColor = .black
        selected1Label.textColor = .white
    }
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
