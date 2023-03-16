//
//  DetailSecondPresenter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/15.
//

import Foundation
import UIKit
class DetailSecondPresenter{
    private let cellId = "UserSetTable"
    private var model: [[String: String]]?
    func set(model: [[String: String]]?) {
        self.model = model
    }
}


// MARK: - CommonTablePresenter
extension DetailSecondPresenter: CommonTablePresenter
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? UserSetTable else {
            return UITableViewCell()
        }
        cell.bind(list: model)
        return cell
    }
    
    func registerCell(to tableView: UITableView) {
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    func height(at indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }
    
}

