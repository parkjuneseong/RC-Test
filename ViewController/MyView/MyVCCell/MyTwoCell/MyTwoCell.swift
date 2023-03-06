//
//  MyTwoCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/06.
//

import UIKit

class MyTwoCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var list: [[String: String]]?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "MyTwoColCell", bundle: nil), forCellWithReuseIdentifier: "MyTwoColCell")
    }
    func bind(list: [[String: String]]?) {
        self.list = list
    }
}

extension MyTwoCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyTwoColCell", for: indexPath as IndexPath) as? MyTwoColCell,
              let list = self.list else {
            return UICollectionViewCell()
        }
        cell.bind(label1: list[indexPath.row]["label1"] ?? "", label2: list[indexPath.row]["label2"] ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = 80
        let height: CGFloat = 80 // collectionViewCell 높이

        return CGSize(width: width, height: height)
    }
}
 
