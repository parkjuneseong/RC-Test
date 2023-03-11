//
//  HomeVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit
protocol TabBarButtonDelegate: AnyObject {
    func areaViewAction()
}
class HomeVC: UIViewController {
    weak var delegate : TabBarButtonDelegate?
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navigationBar: UIView!
    @IBAction func menuMove(_ sender: Any) {
        let vc = MenuVC()
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
       
        self.present(vc, animated: true)
    }
    @IBAction func searchMove(_ sender: Any) {
        let vc = SearchVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
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
    let threeList = [
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"]
        ]
    let fourthList = [
        ["image" : "test","price" : "195만원", "title": "지금 세상에서 제일 인기 좋은 뉴발라슨 ?"],
        ["image" : "test","price" : "195만원", "title": "지금 세상에서 제일 인기 좋은 뉴발라슨 ?"],
        ["image" : "test","price" : "195만원", "title": "지금 세상에서 제일 인기 좋은 뉴발라슨 ?"],
        ["image" : "test","price" : "195만원", "title": "지금 세상에서 제일 인기 좋은 뉴발라슨 ?"],
        ["image" : "test","price" : "195만원", "title": "지금 세상에서 제일 인기 좋은 뉴발라슨 ?"],
        ["image" : "test","price" : "195만원", "title": "지금 세상에서 제일 인기 좋은 뉴발라슨 ?"]
    ]
    let fifthList = [
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"]
    ]
    let sixthList = [
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        ["image" : "test" , "price" : "190만원", "title" : "20대에 제일 잘나간거에여"],
        
    ]
    let sevenList = [
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"],
        ["image" : "test", "price" : "100원","title" : "팝니다"]
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
        let window = UIApplication.shared.windows.first
        self.tableView.contentInset.top = -(window?.safeAreaInsets.top ?? 0)
        
        setPresenterModel()
        setTablePresenters()
        
        APIService.shared.postSign(param: ["name": "aaa",
                                           "userNickName": "aaa",
                                           "email": "aaa@aaa.com",
                                           "password": "aaa",
                                           "phoneNum": "aaa"]) { model in
            UserDefaults.standard.set(model.result?.userId, forKey: "userId")
        }
        APIService.shared.getMyPage(userId: UserDefaults.standard.object(forKey: "userId") as? String ?? "") { model in
            print(model.result?.openDay)
            print(model.result?.scoreAvg)
        }
        
    }
    
    
//    let firstCell = firstCellModel or listArray
    private func setPresenterModel() {
        
        firstCellPresenter.set(model: topList)
        thirdCellPresenter.set(model: threeList)
        fourthCellPresenter.set(model: fourthList)
        fifthCellPrsenter.set(model: fifthList)
        sixthCellPresenter.set(model: sixthList)
        sevenCellPresnter.set(model:sevenList)
        eighthCellPresenter.set(model: eighthList)
        secondCellPresenter.myFeedDelegate = self
        secondCellPresenter.zzimDelegate = self
        
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
    
    private func setNavigationBarAlpha(offSet: CGFloat) {
        let startPoint: CGFloat = 20
        let endPoint: CGFloat = 50
        
        if offSet < startPoint {
            self.navigationBar.alpha = 0
        } else if offSet > endPoint {
            self.navigationBar.alpha = 1
        } else {
            self.navigationBar.alpha = (offSet - startPoint) / (endPoint - startPoint)
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


extension HomeVC : MyFeedDelegate,ZZimDelegate{
    func zzimAction() {
        let vc1 = ZZimVC()
        self.navigationController?.pushViewController(vc1, animated: true)
    }
    
    func moveMyFeed() {
        print("ee")
        let vc = MyFeedVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension HomeVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.y
        self.setNavigationBarAlpha(offSet: offSet)
    }
}
