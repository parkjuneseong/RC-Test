//
//  XXTableViewCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.
//

import UIKit

class XXTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func bind(text: String) {
        titleLabel.text = text
    }
}
