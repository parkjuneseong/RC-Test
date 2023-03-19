//
//  DetailtwoTable.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/15.
//

import UIKit

class DetailtwoTable: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
     
//    var userSetCell : UserSetCell?
    private var model : [DetailgetUserProductsRes]?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.register(UINib(nibName:"DetailSecondCell",bundle:nil), forCellReuseIdentifier: "DetailSecondCell")
      
    }
    func hideTableViewLastSeparator() {
        let footerView = UIView()
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
      
        tableView.tableFooterView = footerView
    }
    func bind(model : [DetailgetUserProductsRes]) {
        self.model = model
  
    }
}
//
//extension DetailtwoTable : UITableViewDelegate,UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return model?.result?.getUserProductsRes?.count ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailSecondCell", for: indexPath) as? DetailSecondCell else {
//
//            return UITableViewCell()
//         }
//
//
//
//        cell.bind(model: model?.result?.getUserDataRes)
//
//
//        return cell
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
//}
