//
//  FourthColCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class FourthColCell: UICollectionViewCell {

    
    @IBOutlet weak var fourthColImage: UIImageView!
    
    
    @IBOutlet weak var fourthPrice: UILabel!
    
    @IBOutlet weak var fourthTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(image : UIImage,price : String, title : String){
        fourthTitle.text = title
        fourthPrice.text = price
        fourthColImage.image = image
    }

}
