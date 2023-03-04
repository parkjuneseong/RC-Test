//
//  EighthColCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class EighthColCell: UICollectionViewCell {

    @IBOutlet weak var eighthImage: UIImageView!
    
    
    @IBOutlet weak var eighthPrice: UILabel!
    
    
    @IBOutlet weak var eighthTitle: UILabel!
    
    func bind(image:UIImage,price : String , title: String){
        eighthTitle.text = title
        eighthPrice.text = price
        eighthImage.image = image
    }

}
