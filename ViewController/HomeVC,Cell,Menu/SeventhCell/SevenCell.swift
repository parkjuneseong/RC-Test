//
//  SevenCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class SevenCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var list: [[String: String]]?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "SevenCelCell", bundle: nil), forCellWithReuseIdentifier: "SevenCelCell")
    }
    func bind(list: [[String: String]]?) {
        self.list = list
    }
}

extension SevenCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SevenCelCell", for: indexPath as IndexPath) as? SevenCelCell,
              let list = self.list else {
            return UICollectionViewCell()
        }
        cell.bind(title: list[indexPath.row]["title"] ?? "", image:(UIImage(named: list[indexPath.row]["image"] ?? "" ) ?? UIImage()), price: list[indexPath.row]["price"] ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (UIScreen.main.bounds.size.width - 50) / 3
        let height: CGFloat = 200 // collectionViewCell 높이
        
        return CGSize(width: width, height: height)
    }
}
