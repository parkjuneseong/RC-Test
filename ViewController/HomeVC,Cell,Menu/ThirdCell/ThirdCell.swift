//
//  ThirdCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class ThirdCell: UITableViewCell {
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    
    @IBOutlet weak var image3: UIImageView!
    
    let imageArray = [UIImage(named: "heartImage"), UIImage(named: "zzim")]
    var currentImageIndex1 = 0
    var currentImageIndex2 = 0
    var currentImageIndex3 = 0
     
    @IBAction func zzim1(_ sender: Any) {
        currentImageIndex1 += 1
         if currentImageIndex1 >= imageArray.count {
             currentImageIndex1 = 0
         }
        image1.image = imageArray[currentImageIndex1]
     
        
    }
    @IBAction func zzim2(_ sender: Any) {
        currentImageIndex2 += 1
         if currentImageIndex2 >= imageArray.count {
             currentImageIndex2 = 0
         }
        image2.image = imageArray[currentImageIndex2]
     
        
    }
    @IBAction func zzim3(_ sender: Any) {
        currentImageIndex3 += 1
         if currentImageIndex3 >= imageArray.count {
             currentImageIndex3 = 0
         }
        image3.image = imageArray[currentImageIndex3]
     
        
    }
}
