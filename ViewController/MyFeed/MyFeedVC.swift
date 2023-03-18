//
//  MyFeedVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/09.
//

import UIKit

class MyFeedVC: UIViewController {
    var listModel : [[String : String]]?
    let emptyList = [
        ["label" : "내 피드가 없습니다.","image" : "111"]
    ]
    let emptyList2 = [
        ["label" : "나를 팔로우한 상점이 없습니다.","image" : "111"]
    ]
    let liste =  [
        ["label1" : "1", "label2" : "d" , "image1":"111", "image2":"111","image3":"111", "image4":"111"]
    ]
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func searchMove(_ sender: Any) {
        let vc = SearchVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private var selectedIndex: Int = 0 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var list : [String] = []
    var list2 : [String] = []
    var list3 = [
        ["label" : "ㅡㅜ"],
        ["label" : "ㅡㅜ"]
    ]
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var underLine1: UIView!
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var underLine2: UIView!
    
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var underLine3: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var cellLabel : XXEmptyCell?
    @IBAction func control1Action(_ sender: Any) {
        label2.textColor = .lightGray
        label3.textColor = .lightGray
        underLine2.isHidden = true
        underLine3.isHidden = true
        label1.textColor = .black
        underLine1.backgroundColor = .black
        underLine1.isHidden = false
        collectionView.isHidden = false
        tableView.isHidden = true
        cellLabel?.label1.text = "내 피드가 아직 없습니다."
        selectedIndex = 0
        
    }
    @IBAction func control2Action(_ sender: Any) {
        label1.textColor = .lightGray
        label3.textColor = .lightGray
        underLine1.isHidden = true
        underLine3.isHidden = true
        label2.textColor = .black
        underLine2.backgroundColor = .black
        underLine2.isHidden = false
        cellLabel?.label1.text = "내가 팔로우한 상점이 없습니다."
        collectionView.isHidden = false
        tableView.isHidden = true
        selectedIndex = 1
    }
    @IBAction func control3Action(_ sender: Any) {
        label1.textColor = .lightGray
        label2.textColor = .lightGray
        underLine1.isHidden = true
        underLine2.isHidden = true
        label3.textColor = .black
        underLine3.backgroundColor = .black
        underLine3.isHidden = false
        tableView.isHidden = false
        selectedIndex = 2
        collectionView.isHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "NoEmptyCell", bundle: nil), forCellWithReuseIdentifier: "NoEmptyCell")
        collectionView.register(UINib(nibName: "XXEmptyCell", bundle: nil), forCellWithReuseIdentifier: "XXEmptyCell")
        tableView.register(UINib(nibName: "FollowTableCell", bundle: nil), forCellReuseIdentifier: "FollowTableCell")

     
    }
}

extension MyFeedVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
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
        case 2:
            if list3.isEmpty {
                return 1
            } else {
                return list3.count
            }
            
        default:
            return 0
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch selectedIndex {
        case 0:
            if list.isEmpty {
               guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XXEmptyCell", for: indexPath) as? XXEmptyCell else {
                   return UICollectionViewCell()
               }
                cell.bind(label: emptyList[indexPath.row]["label"] ?? "", image: (UIImage(named:emptyList[indexPath.row]["image"] ?? "") ?? UIImage()) )
    
                
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoEmptyCell", for: indexPath) as? NoEmptyCell else {
                    return UICollectionViewCell()
                }
                cell.bind(label: list[indexPath.row] )
                return cell
            }
        case 1:
            if list2.isEmpty {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XXEmptyCell", for: indexPath) as? XXEmptyCell else {
                    return UICollectionViewCell()
                }
                 cell.bind(label: emptyList2[indexPath.row]["label"] ?? "", image: (UIImage(named:emptyList2[indexPath.row]["image"] ?? "") ?? UIImage()) )
     
                 
                 return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoEmptyCell", for: indexPath) as? NoEmptyCell else {
                    return UICollectionViewCell()
                }
                cell.bind(label: list2[indexPath.row])
                return cell
            }
        case 2:
            if list3.isEmpty {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XXEmptyCell", for: indexPath)
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoEmptyCell", for: indexPath) as? NoEmptyCell else {
                    return UICollectionViewCell()
                }
                cell.bind(label: list3[indexPath.row]["label"] ?? "")
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
extension MyFeedVC : UITableViewDataSource,UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liste.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  "FollowTableCell", for: indexPath) as? FollowTableCell else {
            return UITableViewCell()
        }
        cell.bind(image1: (UIImage(named:liste[indexPath.row]["image1"] ?? "") ?? UIImage()), image2: (UIImage(named:liste[indexPath.row]["image2"] ?? "") ?? UIImage()), image3: (UIImage(named:liste[indexPath.row]["image3"] ?? "") ?? UIImage()), image4: (UIImage(named:liste[indexPath.row]["image4"] ?? "") ?? UIImage()), label1: liste[indexPath.row]["label1"] ?? "", label2: liste[indexPath.row]["label2"] ?? "")
        return cell
    }
    func height(at indexPath: IndexPath) -> CGFloat {
        return 180
    }

    func numberOfRows(in section: Int) -> Int {
        return 1
    }
}
