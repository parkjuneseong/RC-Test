//
//  DetailOnePresenter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.
//

import UIKit

class DetailOnePresenter {
    private let cellId = "DetailOneCell"
    private var model: DetailModel?
    
    func set(model: DetailModel?) {
        self.model = model
    }
}


// MARK: - CommonTablePresenter
extension DetailOnePresenter: CommonTablePresenter
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? DetailOneCell else {
            return UITableViewCell()
        }
        cell.bind(model: model?.result)
        
        return cell
    }
    
    func registerCell(to tableView: UITableView) {
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    func height(at indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }
    
    var headerView: UIView? {
        get {
            return nil
        } set {
            _ = newValue
        }
    }
    
    var headerHeight: CGFloat {
        get {
            return .leastNormalMagnitude
        } set {
            _ = newValue
        }
    }
    
    var footerView: UIView? {
        get {
            return nil
        } set {
            _ = newValue
        }
    }
    
    var footerHeight: CGFloat {
        get {
            return .leastNormalMagnitude
        } set {
            _ = newValue
        }
    }
}
