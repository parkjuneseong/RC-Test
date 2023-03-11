//
//  FifthCellPresenter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class FifthCellPresenter {
    private let cellId = "FifthCell"
    private var model: [[String: String]]?
    
    func set(model: [[String: String]]?) {
        self.model = model
    }
 }

 // MARK: - CommonTablePresenter
 extension FifthCellPresenter: CommonTablePresenter
 {
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? FifthCell else {
             return UITableViewCell()
         }
         
         cell.bind(list: model)
         
         return cell
     }
     
     func registerCell(to tableView: UITableView) {
         tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
     }
     
     func height(at indexPath: IndexPath) -> CGFloat {
         return 600
         
     }
     
     func numberOfRows(in section: Int) -> Int {
         return 1
     }

    var headerView: UIView? {
        get {
            let view = CommonHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
            view.headerLabel.text = "나만 없어! 유니클로"
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
             let view = ShowMoreFooter(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 35))
             view.footerLabel.text = "더보기"
             view.touchAction = { [weak self] in
                 print("sdadsad")
                 let vc = ZZimVC()
                 
             }
            
             
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

