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
    weak var zzimDelegate: ZZimDelegate?
     
    func set(model: [[String: String]]?) {
        self.model = model
    }
}

// MARK: - CommonTablePresenter
extension MyFourCellPresenter: CommonTablePresenter
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyFourCell", for: indexPath) as? MyFourCell else {
                return UITableViewCell()
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyFiveCell", for: indexPath) as? MyFiveCell else {
                return UITableViewCell()
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MySixCell", for: indexPath) as? MySixCell else {
                return UITableViewCell()
            }
           
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func registerCell(to tableView: UITableView) {
        tableView.register(UINib(nibName: "MyFourCell", bundle: nil), forCellReuseIdentifier: "MyFourCell")
        tableView.register(UINib(nibName: "MyFiveCell", bundle: nil), forCellReuseIdentifier: "MyFiveCell")
        tableView.register(UINib(nibName: "MySixCell", bundle: nil), forCellReuseIdentifier: "MySixCell")
    }
    
    func height(at indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 160
        case 1:
            return 300
        case 2:
            return 400
        default:
            return 0
        }
    }

    func numberOfRows(in section: Int) -> Int {
        return 3
    }
    
    var headerView: UIView? {
        get {
            let view = MyHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
            view.headerLabel1.text = "판매상품"
            view.headerLabel2.text = "상점후기"
            view.headerLabel3.text = "찜목록"
            view.zzimDelegate = zzimDelegate
            
            
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
