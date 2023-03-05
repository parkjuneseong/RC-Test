//
//  FirstColCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class FirstColCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var topImage: UIImageView!
    func bind(image : UIImage,label : String){
        topImage.image = image
        topLabel.text = label
    }
}
