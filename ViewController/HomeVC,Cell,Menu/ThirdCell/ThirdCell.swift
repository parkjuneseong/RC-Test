//
//  ThirdCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit
import Alamofire
import AlamofireImage


class ThirdCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var model: [HomeProductsResultModel]?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "ThirdColCell", bundle: nil), forCellWithReuseIdentifier: "ThirdColCell")
    }
    func bind(model: [HomeProductsResultModel]?){
        
    }
}


extension ThirdCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdColCell", for: indexPath as IndexPath) as? ThirdColCell
              else {
            return UICollectionViewCell()
        }
        cell.bind(model: model?[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (UIScreen.main.bounds.size.width - 50) / 3
        let height: CGFloat = 200 // collectionViewCell 높이
        
        return CGSize(width: width, height: height)
    }
}





 
