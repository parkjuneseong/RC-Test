//
//  MyFeedVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/09.
//

import UIKit

class MyFeedVC: UIViewController {
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func searchMove(_ sender: Any) {
        let vc = SearchVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private var selectedIndex: Int = 0 {
        didSet {
            tableView.reloadData()
        }
    }
    
    var list = ["1", "2", "3", "4", "5"]
    var list2 = ["가", "나", "다", "라"]
    var list3: [String] = []
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var underLine1: UIView!
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var underLine2: UIView!
    
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var underLine3: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func control1Action(_ sender: Any) {
        label2.textColor = .lightGray
        label3.textColor = .lightGray
        underLine2.isHidden = true
        underLine3.isHidden = true
        label1.textColor = .black
        underLine1.backgroundColor = .black
        underLine1.isHidden = false
        
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
        
        selectedIndex = 2
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "XXTableViewCell", bundle: nil), forCellReuseIdentifier: "XXTableViewCell")
        tableView.register(UINib(nibName: "XXEmptyTableViewCell", bundle: nil), forCellReuseIdentifier: "XXEmptyTableViewCell")
    }
}

extension MyFeedVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch selectedIndex {
        case 0:
            if list.isEmpty {
                let cell = tableView.dequeueReusableCell(withIdentifier: "XXEmptyTableViewCell", for: indexPath)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "XXTableViewCell", for: indexPath) as? XXTableViewCell else {
                    return UITableViewCell()
                }
                cell.bind(text: list[indexPath.row])
                return cell
            }
        case 1:
            if list2.isEmpty {
                let cell = tableView.dequeueReusableCell(withIdentifier: "XXEmptyTableViewCell", for: indexPath)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "XXTableViewCell", for: indexPath) as? XXTableViewCell else {
                    return UITableViewCell()
                }
                cell.bind(text: list2[indexPath.row])
                return cell
            }
        case 2:
            if list3.isEmpty {
                let cell = tableView.dequeueReusableCell(withIdentifier: "XXEmptyTableViewCell", for: indexPath)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "XXTableViewCell", for: indexPath) as? XXTableViewCell else {
                    return UITableViewCell()
                }
                cell.bind(text: list3[indexPath.row])
                return cell
            }
        default:
            break
        }
        
        return UITableViewCell()
    }
}
