//
//  MyOneCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/06.
//

import UIKit

class MyOneCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    func bind(model: MyPageModel) {
        nameLabel.text = model.result?.userNickName
    }
    
}
