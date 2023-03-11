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
    var currentImageIndex = false
    
     
    @IBAction func zzim1(_ sender: Any) {
        currentImageIndex.toggle()
        image1.image = currentImageIndex ? UIImage(named: "zzim") : UIImage(named: "heartImage")
     
        
    }
    @IBAction func zzim2(_ sender: Any) {
        currentImageIndex.toggle()
        image2.image = currentImageIndex ? UIImage(named: "zzim") : UIImage(named: "heartImage")
         
     
        
    }
    @IBAction func zzim3(_ sender: Any) {
        currentImageIndex.toggle()
        image3.image = currentImageIndex ? UIImage(named: "zzim") : UIImage(named: "heartImage")
        
    }
}
