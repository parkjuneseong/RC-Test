//
//  DetailSecondCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/15.
//

import UIKit

class DetailSecondCell: UITableViewCell {
    private var model: [DetailgetUserProductsRes] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(model : [DetailgetUserProductsRes]){
        self.model = model
    }
    
}

extension DetailSecondCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailSecondColCell", for: indexPath) as? DetailSecondColCell else {
            return UICollectionViewCell()
        }
        cell.bind(model: model[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 50)/3
        let height = 190
        return CGSize(width: width, height: 190)
    }
}
