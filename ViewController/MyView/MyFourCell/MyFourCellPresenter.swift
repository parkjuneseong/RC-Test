//
//  MyFourCellPresenter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/07.
//

import UIKit
import Foundation
class MyFourCellPresenter {
    private let cellId = "MyFourCell"
    private var model: [[String: String]]?
    
    func set(model: [[String: String]]?) {
        self.model = model
    }
}

// MARK: - CommonTablePresenter
extension MyFourCellPresenter: CommonTablePresenter
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MyFourCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func registerCell(to tableView: UITableView) {
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    func height(at indexPath: IndexPath) -> CGFloat {
        return 160
        
        
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }
    
    var headerView: UIView? {
        get {
            let view = MyHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
            view.headerLabel1.text = "판매상품"
            view.headerLabel2.text = "상점후기"
            view.headerLabel3.text = "찜목록"
            
            
            
            return view
        } set {
            _ = newValue
        }
    }
    
    var headerHeight: CGFloat {
        get {
            return 50
        } set {
            _ = newValue
        }
    }
}
