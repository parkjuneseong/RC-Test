//
//  MyVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//

import UIKit

class MyVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    
    
    private var tablePresenters: [CommonTablePresenter?] = []
    private var myOneCellPresenter = MyOneCellPresenter()
    private var myTwoCellPresenter = MyTwoCellPresenter()
    private var myThreeCellPresenter = MyThreeCellPresenter()
    private var myFourCellPresenter = MyFourCellPresenter()
    private var myFiveCellPresenter = MyFiveCellPresneter()
    private var mySixCellPresenter = MySixCellPresenter()
    var mymodel: MyPageModel?
    let twoList = [
        ["label1": "택배", "label2" : "신청/관리"],
        ["label1": "평점", "label2" : "0"],
        ["label1": "거래내역", "label2" : "0"],
        ["label1": "팔로워", "label2" : "0"],
        ["label1": "팔로잉", "label2" : "0"],
        ["label1": "안전결제", "label2" : "0"],
        ["label1": "오픈일", "label2" : "+3"],
        ["label1": "본인인증", "label2" : "OK"]
    ]
    let fiveList = [
        ["image" : "sadImage" ,"label" : "판매중인 상품이 없습니다"],
        ["image" : "sadImage" ,"label" : "판매중인 상품이 없습니다"],
        ["image" : "sadImage" ,"label" : "판매중인 상품이 없습니다"],
        ["image" : "sadImage" ,"label" : "판매중인 상품이 없습니다"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        
       
        
        setPresenterModel()
        setTablePresenters()
    }
    override func viewWillAppear(_ animated: Bool) {
        APIService.shared.getMyPage(userId: "17") { [weak self] model in
            self?.mymodel = model
            self?.setPresenterModel()
            self?.tableView.reloadData()
        }
    }
    
//    let firstCell = firstCellModel or listArray
    private func setPresenterModel() {
//        myOneCellPresenter.set(model: mymodel)
        myTwoCellPresenter.set(model: twoList)
        myFourCellPresenter.zzimDelegate = self
        
    }
    
    
    private func setTablePresenters() {
        tablePresenters.removeAll()
        tablePresenters.append(myOneCellPresenter)
        tablePresenters.append(myTwoCellPresenter)
        tablePresenters.append(myThreeCellPresenter)
        tablePresenters.append(myFourCellPresenter)
    
        
        registerCells()
        tableView.reloadData()
    }
    
    func registerCells() {
        
        tablePresenters.forEach {
            $0?.registerCell(to: tableView)
        }
    }
}

extension MyVC: UITableViewDelegate, UITableViewDataSource{

  
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tablePresenters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = tablePresenters[section] else {
            return 0
        }
        return presenter.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = tablePresenters[indexPath.section],
              let cell = presenter.tableView(tableView, cellForRowAt: indexPath)
        else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let presenter = tablePresenters[indexPath.section] else {
            // cell의 height는 0이되면 안됨
            // 그래서 leastNormalMagnitude = 0.00000000.........001이라고 보면댐
            return .leastNormalMagnitude
        }
        return presenter.height(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let presenter = tablePresenters[section] else {
            return nil
        }
        return presenter.headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let presenter = tablePresenters[section] else {
            return .leastNormalMagnitude
        }
        
        return presenter.headerHeight
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let presenter = tablePresenters[section] else {
            return nil
        }
        return presenter.footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let presenter = tablePresenters[section] else {
            return .leastNormalMagnitude
        }
        
        return presenter.footerHeight
    }
}

extension MyVC: ZZimDelegate {
    func zzimAction() {
        let vc = ZZimVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
