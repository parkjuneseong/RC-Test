//
//  ZZimProductCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/18.
//

import UIKit

protocol ZZimProductCellDelegate: AnyObject {
    func reload()
}

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
    
    private var likeId: Int?
    weak var delegate: ZZimProductCellDelegate?
    
    func bind(model: AddLikeResultModel?, type: ZZimType) {
        guard let model = model else {
            return
        }
        self.likeId = model.likeId
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
    
    @IBAction private func heartControlAction(_ sender: UIControl) {
        APIService.shared.patchDeleteLikeModel(likeId: self.likeId ?? 0, param: ["status": "DELETED"]) { [weak self] model in
            if model.code == 1000 {
                showToast(message: model.message ?? "")
                self?.delegate?.reload()
            } else {
                showToast(message: model.message ?? "")
            }
        }
    }
}
