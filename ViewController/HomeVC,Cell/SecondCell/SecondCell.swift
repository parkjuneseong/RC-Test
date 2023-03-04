//
//  SecondCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class SecondCell: UITableViewCell {

    @IBOutlet weak var slot1: UIControl!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func slot1click(_ sender: Any) {
        
        let vc = TalkVC()
        
    }
}
