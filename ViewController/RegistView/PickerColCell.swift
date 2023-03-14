//
//  PickerColCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.
//

import UIKit

class PickerColCell: UICollectionViewCell {

    @IBOutlet weak var control: UIControl!
    @IBOutlet weak var imageControl: UIControl!
    @IBOutlet weak var pickerImage: UIImageView!
    
    @IBOutlet weak var xImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(image : UIImage?){
        if let image = image {
            pickerImage.image = image
            control.isHidden = false
        } else {
            pickerImage.image = UIImage(systemName: "camera.fill")
            control.isHidden = true
        }
    }
}
