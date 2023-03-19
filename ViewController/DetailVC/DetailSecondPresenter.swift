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
    weak var delegate: DetailSecondCellDelegate?
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
        
        cell.bind(model: model?.result)
        cell.delegate = delegate
        return cell
    }
    
    func registerCell(to tableView: UITableView) {
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    func height(at indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = 115
        
        let cellWidth = (UIScreen.main.bounds.width - 50)/3
        let cellHeight = cellWidth * 13 / 10 + 60
        let cellCount = model?.result?.getUserProductsRes?.count ?? 0
        let line: CGFloat = CGFloat(((cellCount - 1) / 3) + 1)
        height += cellHeight * line
        height += (line - 1) * 10
        return height
    }
    
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }
    
    var footerView: UIView? {
        get {
            let view = DetailFooterView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 35))
            view.footerLabel.text = "상품 전체보기"
            
            
            
            return view
        } set {
            _ = newValue
        }
    }
    
    var footerHeight: CGFloat {
        get {
            return 35
        } set {
            _ = newValue
        }
    }
}

