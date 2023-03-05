//
//  SearchTwo.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//

import UIKit

class SearchTwo: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    var list: [[String: String]]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.register(UINib(nibName:"SearchTwoCell",bundle:nil), forCellReuseIdentifier: "SearchTwoCell")
    }
    
    func bind(list: [[String: String]]?) {
        self.list = list
        
        tableView.reloadData()
    }
}

extension SearchTwo : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTwoCell", for: indexPath) as? SearchTwoCell,
              let list = self.list else {
            return UITableViewCell()
        }
        cell.bind(image:UIImage(named:list[indexPath.row]["image"] ?? "") ?? UIImage(), brand: list[indexPath.row]["brand"] ?? "", title: list[indexPath.row]["title"] ?? "")
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
