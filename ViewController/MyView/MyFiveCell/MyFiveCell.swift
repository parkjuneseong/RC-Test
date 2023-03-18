//
//  MyFiveCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/07.
//

import UIKit

class MyFiveCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var list = [
        ["image" : "sadImage" ,"label" : "판매중인 상품이 없습니다"],
        ["image" : "sadImage" ,"label" : "판매중인 상품이 없습니다"],
        ["image" : "sadImage" ,"label" : "판매중인 상품이 없습니다"],
        ["image" : "sadImage" ,"label" : "판매중인 상품이 없습니다"]
    ]
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "MyFiveColCell", bundle: nil), forCellWithReuseIdentifier: "MyFiveColCell")
    }
  
}

extension MyFiveCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyFiveColCell", for: indexPath as IndexPath) as? MyFiveColCell
                        
        cell?.bind(image: (UIImage(named: list[indexPath.row]["image"] ?? "" ) ?? UIImage()), label: list[indexPath.row]["label"] ?? "")
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = 393
        let height: CGFloat = 300 // collectionViewCell 높이

        return CGSize(width: width, height: height)
    }
}
 
