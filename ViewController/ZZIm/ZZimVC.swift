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
        image1.image = UIImage(named:"zzimplus")
        image2.image = UIImage(named:"zzimselected")
        
    }
    
    
    @IBAction func lookControlAction(_ sender: Any) {
        control1.isHidden = true
        zzimLabel.textColor = .lightGray
        zzimUnderLine.isHidden = true
        lookUnderLine.isHidden = false
        lookUnderLine.backgroundColor = .black
        control1.isHidden = true
        image2.image = UIImage(named:"zzimwrite")
        lookLabel.textColor = .black
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ZZimDummyCell", bundle: nil), forCellWithReuseIdentifier: "ZZimDummyCell")
        collectionView.register(UINib(nibName: "ZZimCell", bundle: nil), forCellWithReuseIdentifier: "ZZimCell")
    }
    private var selectedIndex: Int = 0 {
        didSet {
            collectionView.reloadData()
        }
    }
    var list : [String] = []
    var list2 = [["label" : "dd"]]
}
extension ZZimVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch selectedIndex {
        case 0:
            if list.isEmpty {
                return 1
            } else {
                return list.count
            }
        case 1:
            if list2.isEmpty {
                return 1
            } else {
                return list2.count
            }
            
        default:
            return 0
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch selectedIndex {
        case 0:
            if list.isEmpty {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZZimDummyCell", for: indexPath)
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZZimCell", for: indexPath) as? ZZimCell else {
                    return UICollectionViewCell()
                }
                cell.bind(label: list[indexPath.row] )
                return cell
            }
        case 1:
            if list2.isEmpty {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZZimDummyCell", for: indexPath)
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZZimCell", for: indexPath) as? ZZimCell else {
                    return UICollectionViewCell()
                }
                cell.bind(label: list2[indexPath.row]["label"] ?? "")
                return cell
            }
        default:
            break
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 393
        let height: CGFloat = 500 // collectionViewCell 높이
        
        return CGSize(width: width, height: height)
    }
    
}
