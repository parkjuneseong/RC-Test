//
//  DetailSecondCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/15.
//

import UIKit

protocol DetailSecondCellDelegate: AnyObject {
    func selectedSecondCell(indexPath: IndexPath)
}

class DetailSecondCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var productCountLabel: UILabel!
    
    private var model: DetailInforResultModel?
    private var productList: [DetailgetUserProductsRes] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    weak var delegate: DetailSecondCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "DetailSecondColCell", bundle: nil), forCellWithReuseIdentifier: "DetailSecondColCell")
    }
    
    func bind(model : DetailInforResultModel?){
        self.model = model
        self.productList = model?.getUserProductsRes ?? []
        
        profileImageView.kf.setImage(with: URL(string: model?.getUserDataRes?.profileImageUrl ?? "")) { [weak self] result in
            switch result {
            case .success(_):
                break
            case .failure(_):
                self?.profileImageView.image = UIImage(named: "111")
            }
        }
        nicknameLabel.text = model?.getUserDataRes?.userNickName
        scoreLabel.text = "\(model?.getUserDataRes?.score ?? 0.0)"
        productCountLabel.text = "이 상점의 상품 \(model?.getUserProductsRes?.count ?? 0)"
    }
    
}

extension DetailSecondCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailSecondColCell", for: indexPath) as? DetailSecondColCell else {
            return UICollectionViewCell()
        }
        cell.bind(model: productList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 50)/3
        let height = width * 13 / 10 + 60
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectedSecondCell(indexPath: indexPath)
    }
}
