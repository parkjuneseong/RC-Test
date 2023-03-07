//
//  MyFourCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/07.
//

import UIKit

class MyFourCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(named:"showMore")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
