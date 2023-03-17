//
//  Detail.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.
//

import UIKit

class Detail: UIViewController {
    private let productId: Int = 0
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func movePay(_ sender: Any) {
        let payvc = PayVC()
        let vc = UINavigationController(rootViewController: payvc)
        payvc.payDelegate = self
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [
                .custom { _ in
                    return 450
                }
            ]
        }
        self.present(vc, animated: true)
    }
    var detailModel : DetailModel?
    private var tablePresenters: [CommonTablePresenter?] = []
    private var detailOnePresneter = DetailOnePresenter()
//    
//    init(productId: Int) {
//        self.productId = productId
//        super.init(nibName: "Detail", bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        self.productId = 0
//        super.init(coder: coder)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenterModel()
        setTablePresenters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
    }
    
    private func loadData() {
        APIService.shared.getDetail(productId: self.productId) { [weak self] model in
            if model.code == 1000 {
                self?.detailModel = model
                self?.setPresenterModel()
            } else {
                showToast(message: model.message ?? "")
            }
        }
    }
    
    private func setPresenterModel() {
        detailOnePresneter.set(model: detailModel)
        tableView.reloadData()
    }
    
    
    private func setTablePresenters() {
        tablePresenters.removeAll()
        tablePresenters.append(detailOnePresneter)
        registerCells()
        tableView.reloadData()
    }
    
    func registerCells() {
        tablePresenters.forEach {
            $0?.registerCell(to: tableView)
        }
    }
}
extension Detail : UITableViewDelegate,UITableViewDataSource{
    
    
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
extension Detail: PayDelegate {
    func movePay() {
        let vc = PayDetailVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
