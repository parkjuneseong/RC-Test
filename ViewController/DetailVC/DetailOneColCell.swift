//
//  DetailOneColCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/17.
//

import UIKit
import Kingfisher

class DetailOneColCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    func bind(urlString: String) {
        thumbnailImageView.kf.setImage(with: URL(string: urlString))
    }
}
