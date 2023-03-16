//
//  FirstColCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit
import Kingfisher

class FirstColCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
  
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var topImage: UIImageView!
    func bind(model : HomeBannerResultModel){
        let url = URL(string: model.bannerImageUrl ?? "")
        topImage.kf.setImage(with: url)
    }
}
