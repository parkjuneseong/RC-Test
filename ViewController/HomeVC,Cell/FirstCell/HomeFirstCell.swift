//
//  HomeFirstCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class HomeFirstCell: UITableViewCell {
   
    @IBOutlet weak var collectionView: UICollectionView!
  
    var list: [[String: String]]?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "FirstColCell", bundle: nil), forCellWithReuseIdentifier: "FirstColCell")
    }
    func bind(list: [[String: String]]?) {
        self.list = list
    }
}

extension HomeFirstCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstColCell", for: indexPath as IndexPath) as? FirstColCell,
              let list = self.list else {
            return UICollectionViewCell()
        }
        cell.bind(image: (UIImage(named: list[indexPath.row]["image"] ?? "" ) ?? UIImage()), label: list[indexPath.row]["label"] ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = 390
        let height: CGFloat = 200 // collectionViewCell 높이

        return CGSize(width: width, height: height)
    }
}
 
