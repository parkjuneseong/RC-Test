//
//  MyTwoColCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/06.
//

import UIKit

class MyTwoColCell: UICollectionViewCell {

    @IBOutlet weak var twoLabel1: UILabel!
    @IBOutlet weak var twoLabel2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(label1: String , label2: String){
        twoLabel1.text = label1
        twoLabel2.text = label2
    }
}
