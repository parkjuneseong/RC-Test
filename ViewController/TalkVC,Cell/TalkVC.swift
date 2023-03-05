//
//  TalkVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class TalkVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    private var tablePresenters: [CommonTablePresenter?] = []
    private var talkOnePresenter = TalkOnePresenter()
    
    
    let oneList = [
        ["image": "test" , "label1": "번개장터", "label2" : "사기 위험! 안전결제란?"],
        ["image": "test" , "label1": "번개장터", "label2" : "사기 위험! 안전결제란?"],
        ["image": "test" , "label1": "번개장터", "label2" : "사기 위험! 안전결제란?"],
        ["image": "test" , "label1": "번개장터", "label2" : "사기 위험! 안전결제란?"],
        ["image": "test" , "label1": "번개장터", "label2" : "사기 위험! 안전결제란?"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        
        
        
        
        setPresenterModel()
        setTablePresenters()
    }
//    let firstCell = firstCellModel or listArray
    private func setPresenterModel() {
        talkOnePresenter.set(model: oneList)
   
    }
    private func setTablePresenters() {
        tablePresenters.removeAll()
        tablePresenters.append(talkOnePresenter)
        registerCells()
        tableView.reloadData()
    }
    
    func registerCells() {
        
        tablePresenters.forEach {
            $0?.registerCell(to: tableView)
        }
    }
}

extension TalkVC: UITableViewDelegate, UITableViewDataSource{

  
    
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
     
}
