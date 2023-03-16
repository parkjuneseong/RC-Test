//
//  UserSetTable.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/14.
//

import UIKit

class UserSetTable: UITableViewCell {
    @IBOutlet weak var tableView: UITableView!
    
    var list: [[String: String]]?
//    var userSetCell : UserSetCell?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.register(UINib(nibName:"UserSetCell",bundle:nil), forCellReuseIdentifier: "UserSetCell")
      
    }
    func hideTableViewLastSeparator() {
        let footerView = UIView()
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
      
        tableView.tableFooterView = footerView
    }
    func bind(list: [[String: String]]?) {
        self.list = list
  
    }
}

extension UserSetTable : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserSetCell", for: indexPath) as? UserSetCell,
              
              let list = self.list else {
            
            return UITableViewCell()
         }
       

        
        cell.bind(label: list[indexPath.row]["label"] ?? "")
         
            if indexPath.row == list.count - 1 {
                cell.lineView.isHidden = true
            } else {
                cell.lineView.isHidden = false
            }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
