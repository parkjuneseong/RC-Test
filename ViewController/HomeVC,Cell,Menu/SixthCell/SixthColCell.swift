//
//  SixthColCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class SixthColCell: UICollectionViewCell {

    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var sixthImage: UIImageView!
    
    @IBOutlet weak var sixthPrice: UILabel!
    
    @IBOutlet weak var sixthTitle: UILabel!
    let imageArray = [UIImage(named: "heartImage"), UIImage(named: "zzim")]
    var currentImageIndex = false

    @IBAction func controlAction(_ sender: Any) {
        currentImageIndex.toggle()
        heartImage.image = currentImageIndex ? UIImage(named: "zzim") : UIImage(named: "heartImage")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(image : UIImage , price : String, title : String){
        sixthTitle.text = title
        sixthPrice.text = price
        sixthImage.image = image
    }

}
