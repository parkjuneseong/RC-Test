//
//  FifthColCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.
//

import UIKit

class FifthColCell: UICollectionViewCell {

    @IBOutlet weak var fifthImage: UIImageView!
    
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var cellPrice: UILabel!
    
    @IBOutlet weak var cellTitle: UILabel!
    
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
    func bind(title : String,image:UIImage,price:String){
        fifthImage.image = image
        cellPrice.text = price
        cellTitle.text = title
    }

}
