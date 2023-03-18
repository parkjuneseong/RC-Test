//
//  XXEmptyCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/17.
//

import UIKit

class XXEmptyCell: UICollectionViewCell {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var label1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(label : String , image : UIImage){
        image1.image = image
        label1.text = label
    }

}
