//
//  ThirdCellPresneter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit
import Alamofire
import AlamofireImage
class ThirdCellPresenter {
   private let cellId = "ThirdCell"
   private var model: HomeProductsModel?
    private var list : [[String:String]] = []
   func set(model:HomeProductsModel?) {
       self.model = model
    
   }
}

// MARK: - CommonTablePresenter
extension ThirdCellPresenter: CommonTablePresenter
{
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ThirdCell else {
           return UITableViewCell()
       }
       
       cell.bind(model: model?.result)
       
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
            view.headerLabel.text = "최근 본 상품과 비슷해요"
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

