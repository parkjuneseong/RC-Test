//
//  ThirdColCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.
//

import UIKit
import Kingfisher

class ThirdColCell: UICollectionViewCell {
    
    @IBOutlet weak var control: UIControl!
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellPrice: UILabel!
    
    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var heartImage: UIImageView!
    
    @IBOutlet weak var isSagePayImageView: UIImageView!
    
    let imageArray = [UIImage(named: "heartImage"), UIImage(named: "zzim")]
    var productId: Int?
    
    @IBAction func controlAction(_ sender: Any) {
        APIService.shared.postLike(productId: self.productId) { [weak self] model in
            if model.code == 1000 {
                self?.heartImage.image = UIImage(named: "zzim")
                showToast(message: "찜목록에 추가되었습니다.1")
            } else {
                showToast(message: "찜목록에 추가되지 않았습니다.")
            }
        }
    }
    
    func bind(model: HomeProductsResultModel?){
        self.productId = model?.productId
        cellPrice.text = model?.price
        cellTitle.text = model?.title
        isSagePayImageView.isHidden = model?.isSagePay ?? "" == "Y" ? false : true
        cellImage.kf.setImage(with: URL(string: model?.imageUrl ?? ""))
    }
}
 
