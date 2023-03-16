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
    private var serviceSetPresenter = ServiceSetPresenter()
    private var logOutPresenter = LogOutPresenter()
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    let userSetList = [
        ["label" : "계정설정"],["label" : "알림 설정"],["label" : "우리동네 지역 설정"],["label" : "배송지 설정"],["label" : "계좌 설정"],["label" : "간편결제 설정"],["label" : "차단 상점 관리"]
    ]
    let serviceSetList = [
        ["label" : "이용약관"],["label" : "개인정보 처리방침"],["label" : "위치기반 서비스 이용약관"],["label" : "버전정보 9.6.3"]
    ]
    let logOutList = [
        ["label" : "로그아웃(대로)"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenterModel()
        setTablePresenters()
    }
    func hideTableViewLastSeparator() {
        let footerView = UIView()
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
      
        tableView.tableFooterView = footerView
    }
    private func setPresenterModel() {
        userSetPresenter.set(model: userSetList)
        serviceSetPresenter.set(model: serviceSetList)
        logOutPresenter.set(model: logOutList)
        
    }
    private func setTablePresenters() {
        tablePresenters.removeAll()
        tablePresenters.append(userSetPresenter)
        tablePresenters.append(serviceSetPresenter)
        tablePresenters.append(logOutPresenter)
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
    
}
