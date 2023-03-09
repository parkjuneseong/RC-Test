//
//  FirstCellPresenter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class FirstCellPresenter {
   private let cellId = "HomeFirstCell"
   private var model: [[String: String]]?
   
   func set(model: [[String: String]]?) {
       self.model = model
   }
}

// MARK: - CommonTablePresenter
extension FirstCellPresenter: CommonTablePresenter
{
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? HomeFirstCell else {
           return UITableViewCell()
       }
       cell.bind(list: model)
       return cell
   }
   
   func registerCell(to tableView: UITableView) {
       tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
   }
   
   func height(at indexPath: IndexPath) -> CGFloat {
       return 200
   }
   
   func numberOfRows(in section: Int) -> Int {
       return 1
   }
   
}
