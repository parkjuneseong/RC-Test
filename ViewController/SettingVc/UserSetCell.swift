//
//  UserSetCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/14.
//

import UIKit

class UserSetCell: UITableViewCell {

    @IBOutlet weak var setLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    func bind(label : String){
        setLabel.text = label
    }
    
}
