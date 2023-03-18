//
//  DetailSecondPresenter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/15.
//

import Foundation
import UIKit
class DetailSecondPresenter{
    private let cellId = "DetailSecondCell"
    private var model: DetailInfoModel?
    func set(model: DetailInfoModel?) {
        self.model = model
    }
}


// MARK: - CommonTablePresenter
extension DetailSecondPresenter: CommonTablePresenter
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? DetailSecondCell else {
            return UITableViewCell()
        }
        guard let productRes = model?.result?.getUserProductsRes else {
            return UITableViewCell()
        }
        cell.bind(model: productRes)
        return cell
    }
    
    func registerCell(to tableView: UITableView) {
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    func height(at indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }
    
}

