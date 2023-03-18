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
    @IBOutlet weak var contentsLabelHeightConstraint: NSLayoutConstraint!
    
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
        
        detailPrice.text = "\(model?.price ?? "")원"
        detailTitle.text = model?.title
        detailLocation.text = model?.location
        detailProductUpdatedAtTime.text = model?.productUpdatedAtTime
        
        let attribureText = makeAttribute(text: model?.contents ?? "", spacing: 2, fontSize: 17, weight: .regular)
        contentsLabel.attributedText = attribureText
        contentsLabelHeightConstraint.constant = attribureText.height(containerWidth: UIScreen.main.bounds.width - 30)
    }
    
    func makeAttribute(text: String, spacing: CGFloat, fontSize: CGFloat, weight: UIFont.Weight) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))
        let font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        attributedText.addAttribute(.font, value: font, range: NSRange(location: 0, length: attributedText.length))
        return attributedText
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

extension NSAttributedString {
    func height(containerWidth: CGFloat) -> CGFloat {
        let rect = self.boundingRect(with: CGSize(width: containerWidth, height: .greatestFiniteMagnitude),
                                     options: [.usesLineFragmentOrigin, .usesFontLeading],
                                     context: nil)
        return ceil(rect.height)
    }
}
