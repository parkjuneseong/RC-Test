//
//  XXCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/17.
//

import UIKit

class XXCell: UICollectionViewCell {

 
    @IBOutlet weak var label1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(label : String){
        label1.text = label
    }
}
