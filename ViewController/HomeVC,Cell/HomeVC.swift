//
//  HomeVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    private var tablePresenters: [CommonTablePresenter?] = []
    private var firstCellPresenter =  FirstCellPresenter()
    private var secondCellPresenter = SecondCellPresenter()
    private var thirdCellPresenter = ThirdCellPresenter()
    private var fourthCellPresenter = FourthCellPresenter()
    private var fifthCellPrsenter = FifthCellPresenter()
    private var sixthCellPresenter = SixthCellPresenter()
    private var sevenCellPresnter = SevenCellPresenter()
    private var eighthCellPresenter = EighthCellPresenter()
    let topList = [
    ["image" : "testImage1", "label":"10/10 모두보기"],
    ["image" : "testImage2"],
    ["image" : "IMG", "label":"10/10 모두보기"]
    ]
    let fourthList = [
        ["image" : "test","price" : "195만원", "title": "지금 세상에서 제일 인기 좋은 뉴발라슨 ?"],
        ["image" : "test","price" : "195만원", "title": "지금 세상에서 제일 인기 좋은 뉴발라슨 ?"],
        ["image" : "test","price" : "195만원", "title": "지금 세상에서 제일 인기 좋은 뉴발라슨 ?"],
        ["image" : "test","price" : "195만원", "title": "지금 세상에서 제일 인기 좋은 뉴발라슨 ?"],
        ["image" : "test","price" : "195만원", "title": "지금 세상에서 제일 인기 좋은 뉴발라슨 ?"],
        ["image" : "test","price" : "195만원", "title": "지금 세상에서 제일 인기 좋은 뉴발라슨 ?"]
    ]
    let sixthList = [
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        
    ]
    let eighthList = [
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        
        
        
        
        setPresenterModel()
        setTablePresenters()
    }
//    let firstCell = firstCellModel or listArray
    private func setPresenterModel() {
        
        firstCellPresenter.set(model: topList)
        fourthCellPresenter.set(model: fourthList)
        sixthCellPresenter.set(model: sixthList)
        eighthCellPresenter.set(model: eighthList)
        
        
    }
    private func setTablePresenters() {
        tablePresenters.removeAll()
        tablePresenters.append(firstCellPresenter)
        tablePresenters.append(secondCellPresenter)
        tablePresenters.append(thirdCellPresenter)
        tablePresenters.append(fourthCellPresenter)
        tablePresenters.append(fifthCellPrsenter)
        tablePresenters.append(sixthCellPresenter)
        tablePresenters.append(sevenCellPresnter)
        tablePresenters.append(eighthCellPresenter)
        registerCells()
        tableView.reloadData()
    }
    
    func registerCells() {
        
        tablePresenters.forEach {
            $0?.registerCell(to: tableView)
        }
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{

  
    
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
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        guard let presenter = tablePresenters[section] else {
//            return nil
//        }
//        return presenter.footerView
//    }
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        guard let presenter = tablePresenters[section] else {
//            return .leastNormalMagnitude
//        }
//
//        return presenter.footerHeight
//    }
    
}
