//
//  ZZimVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/07.
//

import UIKit

enum ZZimType {
    case zzim
    case recent
}

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
        selectedIndex = 0
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
        selectedIndex = 1
    }
    var deleteLikeModel : DeleteLikeModel?
    var addLikeModel : AddLikeModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ZZimDummyCell", bundle: nil), forCellWithReuseIdentifier: "ZZimDummyCell")
        collectionView.register(UINib(nibName: "ZZimProductCell", bundle: nil), forCellWithReuseIdentifier: "ZZimProductCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    private func loadData(){
        let userId = UserDefaults.standard.string(forKey: "userId") ?? ""
        APIService.shared.getLike(userId: userId) { [weak self] model in
            if model.code == 1000 {
                self?.addLikeModel = model
                self?.collectionView.reloadData()
            } else {
                showToast(message: model.message ?? "")
            }
        }
    }
    
    private var selectedIndex: Int = 0 {
        didSet {
            collectionView.reloadData()
        }
    }
}
extension ZZimVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch selectedIndex {
        case 0:
            if addLikeModel?.result?.isEmpty ?? true {
                return 1
            } else {
                return addLikeModel?.result?.count ?? 0
            }
        case 1:
            return 1
            
        default:
            return 0
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch selectedIndex {
        case 0:
            if addLikeModel?.result?.isEmpty ?? true {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZZimDummyCell", for: indexPath)
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZZimProductCell", for: indexPath) as? ZZimProductCell else {
                    return UICollectionViewCell()
                }
                cell.bind(model: addLikeModel?.result?[indexPath.row], type: .zzim)
                return cell
            }
        case 1:
//            if list2.isEmpty {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZZimDummyCell", for: indexPath)
//                return cell
//            } else {
//                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZZimProductCell", for: indexPath) as? ZZimProductCell else {
//                    return UICollectionViewCell()
//                }
////                cell.bind(model: , type: )
//                return cell
//            }
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZZimDummyCell", for: indexPath)
            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch selectedIndex {
        case 0:
            if addLikeModel?.result?.isEmpty ?? true {
                let size = CGSize(width: UIScreen.main.bounds.width, height: 500)
                return size
            } else {
                let width: CGFloat = (UIScreen.main.bounds.width - 24) / 2
                let height: CGFloat = width + 75
                return CGSize(width: width, height: height)
            }
        case 1:
            let size = CGSize(width: UIScreen.main.bounds.width, height: 500)
            return size
        default:
            return .zero
        }
    }
    
}
