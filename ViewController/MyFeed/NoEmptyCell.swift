//
//  NoEmptyCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/18.
//

import UIKit

class NoEmptyCell: UICollectionViewCell {

    @IBOutlet weak var label1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(label : String){
        label1.text = label
    }
}
