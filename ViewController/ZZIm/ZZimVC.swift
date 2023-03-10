//
//  ZZimVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/07.
//

import UIKit

class ZZimVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var control1: UIControl!
    @IBOutlet weak var control2: UIControl!
    @IBOutlet weak var zzimControl: UIControl!
    @IBOutlet weak var lookControl: UIControl!
    
    @IBOutlet weak var lookLabel: UILabel!
    @IBOutlet weak var zzimLabel: UILabel!
    @IBOutlet weak var zzimUnderLine: UIView!
    
    @IBOutlet weak var lookUnderLine: UIView!
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func zzimControlAction(_ sender: Any) {
        control1.isHidden = false
        zzimLabel.textColor = .black
        zzimUnderLine.backgroundColor = .black
        lookUnderLine.isHidden = true
        zzimUnderLine.isHidden = false
        lookLabel.textColor = .lightGray
        image1.image = UIImage(named:"ball")
        image2.image = UIImage(named:"apple")
        
    }
    
    
    @IBAction func lookControlAction(_ sender: Any) {
        control1.isHidden = true
        zzimLabel.textColor = .lightGray
        zzimUnderLine.isHidden = true
        lookUnderLine.isHidden = false
        lookUnderLine.backgroundColor = .black
        control1.isHidden = true
        image2.image = UIImage(named:"shoes")
        lookLabel.textColor = .black
        
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ZZimDummyCell", bundle: nil), forCellWithReuseIdentifier: "ZZimDummyCell")
        collectionView.register(UINib(nibName: "ZZimCell", bundle: nil), forCellWithReuseIdentifier: "ZZimCell")
    }
 

}
extension ZZimVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZZimDummyCell", for: indexPath as IndexPath) as? ZZimDummyCell
        return cell ?? UICollectionViewCell()
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let width: CGFloat = 393
            let height: CGFloat = 500 // collectionViewCell 높이

            return CGSize(width: width, height: height)
        }
    
}
