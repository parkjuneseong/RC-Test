//
//  ZZimProductCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/18.
//

import UIKit

class ZZimProductCell: UICollectionViewCell {

    @IBOutlet weak var registAtTime: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var zzimImage: UIImageView!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var profileContainerView: UIView!
    
    func bind(model: AddLikeResultModel?, type: ZZimType) {
        guard let model = model else {
            return
        }
        titleLabel.text = model.title
        priceLabel.text = "\(model.price ?? 0)원"
        nickNameLabel.text = model.userNickName
        zzimImage.kf.setImage(with: URL(string: model.imageUrl ?? ""))
        registAtTime.text = model.time
        
        if type == .zzim {
            timeLabel.isHidden = true
            profileContainerView.isHidden = false
        } else {
            timeLabel.isHidden = false
            profileContainerView.isHidden = true
        }
    }
}
