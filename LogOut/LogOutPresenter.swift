//
//  LogOutPresenter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/15.
//

import Foundation
import UIKit
class LogOutPresenter {
    private let cellId = "LogOutTableView"
    private var model: [[String: String]]?
    func set(model: [[String: String]]?) {
        self.model = model
    }
    
}


// MARK: - CommonTablePresenter
extension LogOutPresenter: CommonTablePresenter
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? LogOutTableView else {
            return UITableViewCell()
        }
        cell.bind(list: model)
        return cell
    }
    
    func registerCell(to tableView: UITableView) {
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    func height(at indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }
    var headerView: UIView? {
        get {
            let view = SetDetailHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 35))
            view.headerLabel.text = ""
            view.headerLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 15.0)
            view.backgroundColor = .lightGray
            
            
            return view
        } set {
            _ = newValue
        }
    }
    
    var headerHeight: CGFloat {
        get {
            return 35
        } set {
            _ = newValue
        }
    }
    
}

