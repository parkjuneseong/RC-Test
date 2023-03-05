//
//  EighthCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class EighthCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var list: [[String: String]]?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "EighthColCell", bundle: nil), forCellWithReuseIdentifier: "EighthColCell")
    }
    func bind(list: [[String: String]]?) {
        self.list = list
    }
}

extension EighthCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EighthColCell", for: indexPath as IndexPath) as? EighthColCell,
              let list = self.list else {
            return UICollectionViewCell()
        }
        cell.bind(image: (UIImage(named: list[indexPath.row]["image"] ?? "" ) ?? UIImage()), price: list[indexPath.row]["price"] ?? "",title:list[indexPath.row]["title"] ?? "")
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = 120
        let height: CGFloat = 230 // collectionViewCell 높이

        return CGSize(width: width, height: height)
    }
}
 
