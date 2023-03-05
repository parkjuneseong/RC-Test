//
//  SearchThree.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//

import UIKit

class SearchThree: UITableViewCell {
    
    @IBOutlet weak var tableView: UITableView!
    var list: [[String: String]]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.register(UINib(nibName:"SearchThreeCell",bundle:nil), forCellReuseIdentifier: "SearchThreeCell")
    }
    
    func bind(list: [[String: String]]?) {
        self.list = list
        
        //        tableView.reloadData()
    }
}

extension SearchThree : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchThreeCell", for: indexPath) as? SearchThreeCell,
              let list = self.list else {
            return UITableViewCell()
        }
        cell.bind(title: list[indexPath.row]["title"] ?? "", image:UIImage(named:list[indexPath.row]["image"] ?? "") ?? UIImage(),image2: UIImage(named:list[indexPath.row]["image2"] ?? "") ?? UIImage(), image3:UIImage(named:list[indexPath.row]["image2"] ?? "") ?? UIImage(),image4: UIImage(named:list[indexPath.row]["image4"] ?? "") ?? UIImage(), title2:list[indexPath.row]["title2"] ?? "",title3: list[indexPath.row]["title3"] ?? "", title4:list[indexPath.row]["title4"] ?? "")
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
