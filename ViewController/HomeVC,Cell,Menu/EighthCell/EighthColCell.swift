//
//  EighthColCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class EighthColCell: UICollectionViewCell {
 
    @IBOutlet weak var eighthColImage: UIImageView!
    
    @IBOutlet weak var heartImage: UIImageView!
    
    @IBOutlet weak var eighthPrice: UILabel!
    
    @IBOutlet weak var eighthTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    let imageArray = [UIImage(named: "heartImage"), UIImage(named: "zzim")]
    var currentImageIndex = false

    @IBAction func controlAction(_ sender: Any) {
        currentImageIndex.toggle()
        heartImage.image = currentImageIndex ? UIImage(named: "zzim") : UIImage(named: "heartImage")
    }
    func bind(image : UIImage,price : String, title : String){
        eighthTitle.text = title
        eighthPrice.text = price
        eighthColImage.image = image
    }

}
