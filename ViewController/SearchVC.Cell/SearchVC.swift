//
//  SearchVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func backBtn(_ sender: Any) {
        let vc = RootViewController()
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func backHomeBtn(_ sender: Any) {
        _ = RootViewController(nibName: "HomeVC", bundle: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    private var tablePresenters: [CommonTablePresenter?] = []
    private var searchOneCellPresenter = SearchOnePresenter()
    private var searchTwoPresenter = SearchTwoPresenter()
    private var searchThreePresenter = SearchThreePresenter()
    
    
    let twoList = [
        ["image" : "nike" , "brand": "나이키" , "title" : "nike . 12,222"],
        ["image" : "ylndfles" , "brand": "YLDFLES" , "title" : "YLDFLES . 21,421"],
        ["image" : "visvim" , "brand": "visvim" , "title" : "visvim . 12,522"],
        ["image" : "adererror" , "brand": "adererror" , "title" : "adererror . 42,612"],
        ["image" : "nike" , "brand": "나이키" , "title" : "nike . 7342"],
       
    ]
    let threeList = [
        ["image":"shoes","title" : "스니커즈","image2":"watch","title2" : "시계","image3":"star","title3" : "스타굿즈","image4":"bike","title4" : "자전거"],
        ["image":"motorBike","title" : "오토바이/스쿠터","image2":"doll","title2" : "피규어/인형","image3":"dsGame","title3" : "닌텐도/NDS/Wii","image4":"health","title4" : "헬스/요가/필라테스"],
        ["image":"ball","title" : "축구","image2":"kickboard","title2" : "전동킥보드/전동휠","image3":"camping","title3" : "캠핑","image4":"camera","title4" : "카메라/DSLR"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        
        textField.borderStyle = .none
        
        
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
