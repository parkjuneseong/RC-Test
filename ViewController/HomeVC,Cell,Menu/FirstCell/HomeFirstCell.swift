//
//  HomeFirstCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class HomeFirstCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var number : Int = 1
    var nowPage: Int = 0
    //
    // 데이터 배열
    let dataArray: Array<UIImage> = [UIImage(named: "test")!, UIImage(named: "testImage1")!, UIImage(named: "heartImage")!,UIImage(named: "Home")!]
    var list: [[String: String]]?
    private var model : HomeBannerModel?
//    func set(model: HomeBannerModel?) {
//        self.model = model
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bannerTimer()
        
        
        collectionView.register(UINib(nibName: "FirstColCell", bundle: nil), forCellWithReuseIdentifier: "FirstColCell")
    }
    func bind(model:HomeBannerModel?) {
        self.model = model
        
    }
}

extension HomeFirstCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstColCell", for: indexPath) as? FirstColCell
        cell?.topImage.image = dataArray[indexPath.row]
        cell?.topLabel.text = "\(number)/10 모두보기"
        
        return cell ?? UICollectionViewCell()
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 390
        let height: CGFloat = 200 // collectionViewCell 높이
        
        return CGSize(width: width, height: height)
    }
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        
        if nowPage == dataArray.count-1 {
            // 맨 처음 페이지로 돌아감
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(at: IndexPath(row: 0, section: 0) as IndexPath, at: .right, animated: true)
            collectionView.isPagingEnabled = true
            nowPage = 0
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: IndexPath(row: nowPage, section: 0) as IndexPath, at: .right, animated: true)
        collectionView.isPagingEnabled = true
    }
}

