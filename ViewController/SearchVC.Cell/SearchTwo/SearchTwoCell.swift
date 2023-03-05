//
//  SearchTwoCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//

import UIKit

class SearchTwoCell: UITableViewCell {

    @IBOutlet weak var twoImage: UIImageView!
    
    
    @IBOutlet weak var twoBrand: UILabel!
    
    
    @IBOutlet weak var twoTitle: UILabel!
    var list : [[String:String]]?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(image: UIImage, brand: String,title:String){
        twoTitle.text = title
        twoBrand.text = brand
        twoImage.image = image
    }
    
}
 

