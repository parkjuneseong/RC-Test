//
//  SearchVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    private var tablePresenters: [CommonTablePresenter?] = []
    private var searchOneCellPresenter = SearchOnePresenter()
    private var searchTwoPresenter = SearchTwoPresenter()
    private var searchThreePresenter = SearchThreePresenter()
    
    
    let twoList = [
        ["image" : "test" , "brand": "나이키" , "title" : "nike . 12,222"],
        ["image" : "test" , "brand": "나이키" , "title" : "nike . 12,222"],
        ["image" : "test" , "brand": "나이키" , "title" : "nike . 12,222"],
        ["image" : "test" , "brand": "나이키" , "title" : "nike . 12,222"],
        ["image" : "test" , "brand": "나이키" , "title" : "nike . 12,222"],
        ["image" : "test" , "brand": "나이키" , "title" : "nike . 12,222"],
    ]
    let threeList = [
        ["image":"test","title" : "스니커즈 전자레인지 전으능능는","image2":"test","title2" : "스니커즈 전자레인지 전으능능는","image3":"test","title3" : "스니커즈 전자레인지 전으능능는","image4":"test","title4" : "스니커즈 전자레인지 전으능능는"],
        ["image":"test","title" : "스니커즈 전자레인지 전으능능는","image2":"test","title2" : "스니커즈 전자레인지 전으능능는","image3":"test","title3" : "오토바이/스쿠터","image4":"test","title4" : "스니커즈 전자레인지 전으능능는"],
        ["image":"test","title" : "스니커즈 전자레인지 전으능능는","image2":"test","title2" : "스니커즈 전자레인지 전으능능는","image3":"test","title3" : "전동킥보드/전동휠","image4":"test","title4" : "스니커즈 전자레인지 전으능능는"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        
        
        
        
        setPresenterModel()
        setTablePresenters()
    }
//    let firstCell = firstCellModel or listArray
    private func setPresenterModel() {
        searchTwoPresenter.set(model:twoList)
        searchThreePresenter.set(model:threeList)
    }
    private func setTablePresenters() {
        tablePresenters.removeAll()
        tablePresenters.append(searchOneCellPresenter)
        tablePresenters.append(searchTwoPresenter)
        tablePresenters.append(searchThreePresenter)
        registerCells()
        tableView.reloadData()
    }
    
    func registerCells() {
        
        tablePresenters.forEach {
            $0?.registerCell(to: tableView)
        }
    }
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource{

  
    
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
