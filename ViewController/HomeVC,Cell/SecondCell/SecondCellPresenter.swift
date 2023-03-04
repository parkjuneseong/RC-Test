//
//  SecondCellPresenter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//


import UIKit

class SecondCellPresenter {
   private let cellId = "SecondCell"
   private var model: [[String: String]]?
   
   func set(model: [[String: String]]?) {
       self.model = model
   }
}

// MARK: - CommonTablePresenter
extension SecondCellPresenter: CommonTablePresenter
{
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? SecondCell else {
           return UITableViewCell()
       }
       
       return cell
   }
   
   func registerCell(to tableView: UITableView) {
       tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
   }
   
   func height(at indexPath: IndexPath) -> CGFloat {
       return 180
   }
   
   func numberOfRows(in section: Int) -> Int {
       return 1
   }
   
}
