//
//  ZZimCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.
//

import UIKit

class ZZimCell: UICollectionViewCell {

    @IBOutlet weak var zzimLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(label:String){
        zzimLabel.text = label
    }
}
