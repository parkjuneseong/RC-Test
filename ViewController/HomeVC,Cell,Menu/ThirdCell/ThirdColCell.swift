//
//  ThirdColCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.
//

import UIKit

class ThirdColCell: UICollectionViewCell {
    
    @IBOutlet weak var control: UIControl!
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellPrice: UILabel!
    
    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var heartImage: UIImageView!
    
    
    let imageArray = [UIImage(named: "heartImage"), UIImage(named: "zzim")]
    var currentImageIndex = false

    @IBAction func controlAction(_ sender: Any) {
        currentImageIndex.toggle()
        heartImage.image = currentImageIndex ? UIImage(named: "zzim") : UIImage(named: "heartImage")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initializa
        
        
    }
    func bind(title : String,image:UIImage,price:String){
        cellImage.image = image
        cellPrice.text = price
        cellTitle.text = title
    }
}

 
 
