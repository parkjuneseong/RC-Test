//
//  SetDetailVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/14.
//

import UIKit

class SetDetailVC: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var tablePresenters: [CommonTablePresenter?] = []
    private var userSetPresenter = UserSetPresenter()
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    let list = [
        ["label" : "계정설정"],["label" : "계정설정"],["label" : "계정설정"],["label" : "계정설정"],["label" : "계정설정"],["label" : "계정설정"],["label" : "계정설정"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenterModel()
        setTablePresenters()
    }

    private func setPresenterModel() {
        userSetPresenter.set(model: list)
    }
    private func setTablePresenters() {
        tablePresenters.removeAll()
        tablePresenters.append(userSetPresenter)
        registerCells()
        tableView.reloadData()
    }
    func registerCells() {
        
        tablePresenters.forEach {
            $0?.registerCell(to: tableView)
        }
    }

}

extension SetDetailVC: UITableViewDelegate, UITableViewDataSource{

  
    
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
