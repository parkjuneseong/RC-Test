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
    private var model: MyPageModel?
    
    func set(model: MyPageModel?) {
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
        if let model = model {
            cell.bind(model: model)
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
    var headerView: UIView? {
        get {
            let view = CommonHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 0.01))
             
            view.headerLabel.text = ""
            
            return view
        } set {
            _ = newValue
        }
    }
    
    var headerHeight: CGFloat {
        get {
            .leastNormalMagnitude
        } set {
            _ = newValue
        }
    }
    
}
