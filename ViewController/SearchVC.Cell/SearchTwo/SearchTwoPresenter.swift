//
//  SearchTwoPresenter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//

import UIKit

class SearchTwoPresenter {
    private let cellId = "SearchTwo"
    private var model: [[String: String]]?
    func set(model: [[String: String]]?) {
        self.model = model
    }
 }

 // MARK: - CommonTablePresenter
extension SearchTwoPresenter: CommonTablePresenter
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? SearchTwo else {
            return UITableViewCell()
        }
        cell.bind(list: model)
        return cell
    }
    
    func registerCell(to tableView: UITableView) {
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    func height(at indexPath: IndexPath) -> CGFloat {
        return CGFloat((model?.count ?? 0) * 50)
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }
     

    var headerView: UIView? {
        get {
            let view = CommonHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
            view.headerLabel.text = "추천 브랜드"
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
     var footerView: UIView? {
         get {
             let view = CommonFooterView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 100))
             view.footerLabel.text = "브랜드 모두보기"
            
             
             return view
         } set {
             _ = newValue
         }
     }
     
     var footerHeight: CGFloat {
         get {
             return 100
         } set {
             _ = newValue
         }
     }
}

