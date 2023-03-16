//
//  ServiceSetVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/15.
//

import UIKit

class ServiceSetVC: UITableViewCell {
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [[String: String]]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.register(UINib(nibName:"ServiceSetCell",bundle:nil), forCellReuseIdentifier: "ServiceSetCell")
    }
    
    func bind(list: [[String: String]]?) {
        self.list = list
        
    }
}

extension ServiceSetVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceSetCell", for: indexPath) as? ServiceSetCell,
              let list = self.list else {
            return UITableViewCell()
        }
        cell.bind(label: list[indexPath.row]["label"] ?? "")
        if indexPath.row == list.count - 1 {
            cell.lineView.isHidden = true
            
        }else{
            cell.lineView.isHidden = false
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
