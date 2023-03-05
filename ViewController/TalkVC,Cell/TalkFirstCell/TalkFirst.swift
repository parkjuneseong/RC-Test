//
//  TalkFirst.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//

import UIKit

class TalkFirst: UITableViewCell {
 
    @IBOutlet weak var tableView: UITableView!
    var list: [[String: String]]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.register(UINib(nibName:"TalkFirstCell",bundle:nil), forCellReuseIdentifier: "TalkFirstCell")
    }
    
    func bind(list: [[String: String]]?) {
        self.list = list
        
        //        tableView.reloadData()
    }
}

extension TalkFirst : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TalkFirstCell", for: indexPath) as? TalkFirstCell,
              let list = self.list else {
            return UITableViewCell()
        }
        cell.bind(image:UIImage(named:list[indexPath.row]["image"] ?? "") ?? UIImage(), label1: list[indexPath.row]["label1"] ?? "", label2: list[indexPath.row]["label2"] ?? "")
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
