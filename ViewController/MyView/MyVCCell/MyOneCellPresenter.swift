//
//  MyOneCellPresenter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/06.
//
import UIKit
import Foundation
class MyOneCellPresenter {
    private let cellId = "MyOneCell"
    private var model: [[String: String]]?
    
    func set(model: [[String: String]]?) {
        self.model = model
    }
}

// MARK: - CommonTablePresenter
extension MyOneCellPresenter: CommonTablePresenter
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MyOneCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func registerCell(to tableView: UITableView) {
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    func height(at indexPath: IndexPath) -> CGFloat {
        return 145
        
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }
    
    
}
