//
//  DetailSecondColCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/19.
//

import UIKit

class DetailSecondColCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func bind(model: DetailgetUserProductsRes) {
        titleLabel.attributedText = makeAttribute(text: model.title ?? "", spacing: 0)
        priceLabel.text = "\(model.price ?? "")원"
        if let img = model.getProductsImgRes?.first {
            thumbnailImageView.kf.setImage(with: URL(string: img.imageUrl ?? ""))
        }
    }
    
    func makeAttribute(text: String, spacing: CGFloat) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))
        return attributedText
    }
}

