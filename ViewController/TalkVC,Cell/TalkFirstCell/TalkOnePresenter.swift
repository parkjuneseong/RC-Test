//
//  TalkOnePresenter.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//
 
import UIKit

class TalkOnePresenter {
    private let cellId = "TalkFirst"
    private var model: [[String: String]]?
    func set(model: [[String: String]]?) {
        self.model = model
    }
 }
    

 // MARK: - CommonTablePresenter
extension TalkOnePresenter: CommonTablePresenter
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? TalkFirst else {
            return UITableViewCell()
        }
        cell.bind(list: model)
        return cell
    }
    
    func registerCell(to tableView: UITableView) {
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    func height(at indexPath: IndexPath) -> CGFloat {
        return CGFloat((model?.count ?? 0) * 70)
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }
     

    var headerView: UIView? {
        get {
            let view = TalkHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 250))
            view.headerLabel.text = "전체 대화"
            view.headerImage.image = UIImage(named:"test")
            view.adverTitle.text = "강아지 무료 분양 & 무료 보호"
            view.adverTitle2.text = "안락사 없는 진짜 보호소, 따뜻한 분양소"
            view.lowLabel1.text = "채팅 알림이 꺼져 있어여!"
            view.headerLabel.text = "알림 켜고 채팅 놓치지 않기"
            view.lowImage.image = UIImage(named:"testImage")
            view.lowImage2.image = UIImage(named:"test")
            
//            view.headerLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
            
            
            return view
        } set {
            _ = newValue
        }
    }
    
    var headerHeight: CGFloat {
        get {
            return 220
        } set {
            _ = newValue
        }
    }
      
}

