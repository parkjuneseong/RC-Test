//
//  MyTwoCellPresenter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/06.
//

import Foundation
import UIKit
class MyTwoCellPresenter{
    private let cellId = "MyTwoCell"
    private var model: MyPageModel?
    private var list: [[String: String]] = []
    
    func set(model: MyPageModel?) {
        self.model = model
        
        list.append(["label1": "택배", "label2" : "신청/관리"])
        if let scoreAvg = model?.result?.scoreAvg {
            list.append(["label1": "평점", "label2": "\(scoreAvg)"])
        }
        list.append(["label1": "거래내역", "label2" : "0"])
        list.append(["label1": "팔로워", "label2" : "1"])
        list.append(["label1": "팔로잉", "label2" : "2"])
        list.append(["label1": "안전결제", "label2" : "0"])
        if let openDay = model?.result?.openDay {
            list.append(["label1": "오픈일", "label2": openDay])
        }
        if let userStatusCheck = model?.result?.userStatusCheck {
            list.append(["label1": "본인인증", "label2": userStatusCheck])
        }
    }
}

// MARK: - CommonTablePresenter
extension MyTwoCellPresenter: CommonTablePresenter
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MyTwoCell else {
            return UITableViewCell()
        }
        cell.bind(list: list)
        return cell
    }
    
    func registerCell(to tableView: UITableView) {
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    func height(at indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }
    
}

