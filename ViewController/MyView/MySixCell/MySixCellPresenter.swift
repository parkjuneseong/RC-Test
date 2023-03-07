//
//  MySixCellPresenter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/07.
//
 
import UIKit

class MySixCellPresenter {
   private let cellId = "MySixCell"
   
  
}
   

// MARK: - CommonTablePresenter
extension MySixCellPresenter: CommonTablePresenter
{
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MySixCell else {
           return UITableViewCell()
       }
      
       return cell
   }
   
   func registerCell(to tableView: UITableView) {
       tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
   }
   
   func height(at indexPath: IndexPath) -> CGFloat {
       return 400
   }
    
    
   func numberOfRows(in section: Int) -> Int {
       return 1
   }
    
 
}

