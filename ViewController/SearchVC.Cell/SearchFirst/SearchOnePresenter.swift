//
//  SearchOnePresenter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class SearchOnePresenter {
    private let cellId = "SearchFirstCell"
   
 }

 // MARK: - CommonTablePresenter
 extension SearchOnePresenter: CommonTablePresenter
 {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? SearchFirstCell else {
            return UITableViewCell()
        }
       
        return cell
    }
    
    func registerCell(to tableView: UITableView) {
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    func height(at indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }

    var headerView: UIView? {
        get {
            let view = CommonHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
            view.headerLabel.text = "요즘 많이 찾는 검색어"
            view.headerLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
            
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

