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
    
    private var models: [HomeBannerResultModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bannerTimer()
        collectionView.register(UINib(nibName: "FirstColCell", bundle: nil), forCellWithReuseIdentifier: "FirstColCell")
    }
    
    func bind(models: [HomeBannerResultModel]) {
        self.models = models
    }
}

extension HomeFirstCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstColCell", for: indexPath) as? FirstColCell
        
        cell?.bind(model: models[indexPath.row])
        cell?.topLabel.text = "\(indexPath.row + 1)/\(models.count) 모두보기"
        
        
        return cell ?? UICollectionViewCell()
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 393
        let height: CGFloat = 320 // collectionViewCell 높이
        
        return CGSize(width: width, height: height)
    }
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        
        if nowPage == models.count-1 {
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

