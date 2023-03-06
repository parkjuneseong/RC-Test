//
//  SocialVCCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/06.
//

import UIKit

class SocialVCCell: UICollectionViewCell {

    @IBOutlet weak var bunTitle2: UILabel!
    @IBOutlet weak var bunTitle: UILabel!
    
    @IBOutlet weak var bunImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(title1:String,title2:String,image:UIImage){
        bunTitle.text = title1
        bunTitle2.text = title2
        bunImage.image = image
    }
    

}
