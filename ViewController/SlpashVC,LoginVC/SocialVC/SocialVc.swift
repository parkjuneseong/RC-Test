//
//  SocialVc.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/06.
//

import UIKit

class SocialVc: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let list = [
        ["title1" : "취향을 잇는 거래,\n번개장터","title2" : "요즘 유행하는 메이저 취향부터\n나만 알고싶은 마이너 취향까지" , "image" : "redSocial1"],
        ["title1" : "안전하게\n취향을 잇습니다.","title2" : "번개톡,번개페이로\n거래의 시작부터 끝까지 안전하게" , "image" : "redSocial2"],
        ["title1" : "번개장터에서\n취향을 거래해보세요.","title2" : "지금 바로 번개장터에서\n당신의 취향에 맞는 아이템들을 찾아보세요!" , "image" : "redSocial3"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "SocialVCCell", bundle: nil), forCellWithReuseIdentifier: "SocialVCCell")
        // Do any additional setup after loading the view.
    }
//    func bind(list: [[String: String]]?) {
//        self.list = list
//    }
}
extension SocialVc: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SocialVCCell", for: indexPath as IndexPath) as? SocialVCCell
        cell?.bind(title1: list[indexPath.row]["title1"] ?? "", title2: list[indexPath.row]["title2"] ?? "", image: (UIImage(named: list[indexPath.row]["image"] ?? "" ) ?? UIImage()))
            return cell ?? SocialVCCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = 393
        let height: CGFloat = 400 // collectionViewCell 높이

        return CGSize(width: width, height: height)
    }
}
