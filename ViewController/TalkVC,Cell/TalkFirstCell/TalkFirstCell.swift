//
//  TalkFirstCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class TalkFirstCell: UITableViewCell {
    
    

    @IBOutlet weak var talkImage: UIImageView!
    
    @IBOutlet weak var talkLabel1: UILabel!
    
    
    @IBOutlet weak var talkLabel2: UILabel!
    
    func bind(image:UIImage,label1:String,label2:String){
        talkLabel1.text = label1
        talkLabel2.text = label2
        talkImage.image = image
    }
}
