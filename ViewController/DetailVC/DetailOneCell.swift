//
//  DetailOneCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.
//

import UIKit

class DetailOneCell: UITableViewCell {

    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var detailProductUpdatedAtTime: UILabel!
    @IBOutlet weak var detailLocation: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailPrice: UILabel!
    
    private var model: DetailResultModel? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "DetailOneColCell", bundle: nil), forCellWithReuseIdentifier: "DetailOneColCell")
    }
    
    func bind(model: DetailResultModel?) {
        self.model = model
        
        detailPrice.text = model?.price
        detailTitle.text = model?.title
        detailLocation.text = model?.location
        detailProductUpdatedAtTime.text = model?.productUpdatedAtTime
        contentsLabel.attributedText = makeAttribute(model?.contents, lineSpacing: 2)
    }
    
    private func makeAttribute(_ text: String?, lineSpacing: CGFloat) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = .left
        paragraphStyle.lineBreakMode = .byTruncatingTail
        let attributedStr = NSMutableAttributedString(string: text ?? "")
        attributedStr.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedStr.length))
        
        return attributedStr
    }
}

extension DetailOneCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.imgs?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailOneColCell", for: indexPath) as? DetailOneColCell else {
            return UICollectionViewCell()
        }
        
        cell.bind(urlString: model?.imgs?[indexPath.row].imageUrl ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 300
        let width = UIScreen.main.bounds.width
        
        return CGSize(width: width, height: height)
    }
}
