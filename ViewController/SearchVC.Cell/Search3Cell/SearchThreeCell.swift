//
//  SearchThreeCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//

import UIKit

class SearchThreeCell: UITableViewCell {

    @IBOutlet weak var threetitle: UILabel!
    @IBOutlet weak var threeImage: UIImageView!
    
    @IBOutlet weak var threetitle2: UILabel!
    
    @IBOutlet weak var threetitle3: UILabel!
    
    @IBOutlet weak var threetitle4: UILabel!
    
    @IBOutlet weak var threeImage2: UIImageView!
    
    @IBOutlet weak var threeImage3: UIImageView!
    
    @IBOutlet weak var threeImage4: UIImageView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(title:String, image : UIImage,image2:UIImage,image3:UIImage,image4:UIImage,title2:String,title3:String,title4:String){
        threetitle.text = title
        threeImage.image = image
        threetitle2.text = title2
        threeImage2.image = image2
        threetitle3.text = title3
        threeImage3.image = image3
        threetitle4.text = title4
        threeImage4.image = image4
        
        
        
    }
}
