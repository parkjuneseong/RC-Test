//
//  MyFiveColCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/09.
//

import UIKit

class MyFiveColCell: UICollectionViewCell {

    @IBOutlet weak var fiveLabel: UILabel!
    @IBOutlet weak var fiveImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(image : UIImage, label : String){
        fiveLabel.text = label
        fiveImage.image = image
        
    }
}
