//
//  FollowTableCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/17.
//

import UIKit

class FollowTableCell: UITableViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    
    @IBOutlet weak var followLabel: UILabel!
    
    @IBOutlet weak var stackImage1: UIImageView!
    
    @IBOutlet weak var stackImage2: UIImageView!
    
    @IBOutlet weak var stackImage3: UIImageView!
    
    func bind(image1:UIImage,image2:UIImage,image3:UIImage,image4:UIImage,label1:String,label2:String){
        mainImage.image = image1
        stackImage1.image = image2
        stackImage2.image = image3
        stackImage3.image = image4
        nickNameLabel.text = label1
        followLabel.text = label2
        
    }
    
}
