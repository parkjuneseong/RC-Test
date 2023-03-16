//
//  LogOutTableView.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/15.
//

import UIKit

class LogOutTableView: UITableViewCell {
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [[String: String]]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.register(UINib(nibName:"LogOutCell",bundle:nil), forCellReuseIdentifier: "LogOutCell")
    }
    
    func bind(list: [[String: String]]?) {
        self.list = list
        
    }
}

extension LogOutTableView : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LogOutCell", for: indexPath) as? LogOutCell,
            let list = self.list else {
            return UITableViewCell()
        }
        cell.bind(label: list[indexPath.row]["label"] ?? "")
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
