//
//  HomeVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit
import Alamofire
import AlamofireImage
protocol TabBarButtonDelegate: AnyObject {
    func areaViewAction()
}
class HomeVC: UIViewController {
    @IBOutlet weak var testLabel: UILabel!
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
    var bannerModel : HomeBannerModel?
    var productsModel : HomeProductsModel?
    private var tablePresenters: [CommonTablePresenter?] = []
    private var firstCellPresenter =  FirstCellPresenter()
    private var secondCellPresenter = SecondCellPresenter()
    private var thirdCellPresenter = ThirdCellPresenter()
    private var fourthCellPresenter = FourthCellPresenter()
    private var fifthCellPrsenter = FifthCellPresenter()
    private var sixthCellPresenter = SixthCellPresenter()
    private var sevenCellPresnter = SevenCellPresenter()
    private var eighthCellPresenter = EighthCellPresenter()
     
     
    let threeList = [
        ["image" : "shoes1", "price" : "25,000원원","title" : "RED VANS 윅스 [교환] "],
        ["image" : "shoes2", "price" : "45,000원원","title" : "WHITE VANS 남녀공용 화이트"],
        ["image" : "shoes3", "price" : "27,000원원","title" : "프리즘 웍스 SNSNW-04"],
        ["image" : "shoes4", "price" : "75,000원원","title" : "마크 곤잘레스 알로하 남녀공용 스니커즈 오키드 핑크"],
        ["image" : "clothes1", "price" : "23,000원원","title" : "소프트 필링 세미오버 라운드 니트 초코브라운 "],
        ["image" : "clothes2", "price" : "44,000원원","title" : "아반디 타임 SANKND[일반/기모]"],
        ["image" : "shoes3", "price" : "62,000원원","title" : "팝니다"],
        ["image" : "shoes1", "price" : "12,000원원","title" : "팝니다"],
        ["image" : "shoes4", "price" : "63,000원원","title" : "마크 곤잘레스 알로하 남녀공용 스니커즈 오키드 핑크"]
        ]
    let fourthList = [
        ["image" : "shoes1", "price" : "25,000원원","title" : "RED VANS 윅스 [교환] "],
        ["image" : "shoes2", "price" : "45,000원원","title" : "WHITE VANS 남녀공용 화이트"],
        ["image" : "shoes3", "price" : "27,000원원","title" : "프리즘 웍스 SNSNW-04"],
        ["image" : "shoes4", "price" : "75,000원원","title" : "마크 곤잘레스 알로하 남녀공용 스니커즈 오키드 핑크"],
        ["image" : "clothes1", "price" : "23,000원원","title" : "소프트 필링 세미오버 라운드 니트 초코브라운 "],
 
        ]
    let fifthList = [
        ["image" : "shoes1", "price" : "25,000원원","title" : "RED VANS 윅스 [교환] "],
        ["image" : "shoes2", "price" : "45,000원원","title" : "WHITE VANS 남녀공용 화이트"],
        ["image" : "shoes3", "price" : "27,000원원","title" : "프리즘 웍스 SNSNW-04"],
        ["image" : "shoes4", "price" : "75,000원원","title" : "마크 곤잘레스 알로하 남녀공용 스니커즈 오키드 핑크"],
        ["image" : "clothes1", "price" : "23,000원원","title" : "소프트 필링 세미오버 라운드 니트 초코브라운 "],
        ["image" : "clothes2", "price" : "44,000원원","title" : "아반디 타임 SANKND[일반/기모]"],
        ["image" : "shoes3", "price" : "62,000원원","title" : "팝니다"],
        ["image" : "shoes1", "price" : "12,000원원","title" : "팝니다"],
        ["image" : "shoes4", "price" : "63,000원원","title" : "마크 곤잘레스 알로하 남녀공용 스니커즈 오키드 핑크"]
        ]
    let sixthList = [
        ["image" : "shoes1", "price" : "25,000원원","title" : "RED VANS 윅스 [교환] "],
        ["image" : "shoes2", "price" : "45,000원원","title" : "WHITE VANS 남녀공용 화이트"],
        ["image" : "shoes3", "price" : "27,000원원","title" : "프리즘 웍스 SNSNW-04"],
        ["image" : "shoes4", "price" : "75,000원원","title" : "마크 곤잘레스 알로하 남녀공용 스니커즈 오키드 핑크"],
        ["image" : "clothes1", "price" : "23,000원원","title" : "소프트 필링 세미오버 라운드 니트 초코브라운 "],
        ["image" : "clothes2", "price" : "44,000원원","title" : "아반디 타임 SANKND[일반/기모]"],
       
    ]
    let sevenList = [
        ["image" : "shoes1", "price" : "25,000원원","title" : "RED VANS 윅스 [교환] "],
        ["image" : "shoes2", "price" : "45,000원원","title" : "WHITE VANS 남녀공용 화이트"],
        ["image" : "shoes3", "price" : "27,000원원","title" : "프리즘 웍스 SNSNW-04"],
        ["image" : "shoes4", "price" : "75,000원원","title" : "마크 곤잘레스 알로하 남녀공용 스니커즈 오키드 핑크"],
        ["image" : "clothes1", "price" : "23,000원원","title" : "소프트 필링 세미오버 라운드 니트 초코브라운 "],
        ["image" : "clothes2", "price" : "44,000원원","title" : "아반디 타임 SANKND[일반/기모]"],
        ["image" : "shoes3", "price" : "62,000원원","title" : "팝니다"],
        ["image" : "shoes1", "price" : "12,000원원","title" : "팝니다"],
        ["image" : "shoes4", "price" : "63,000원원","title" : "마크 곤잘레스 알로하 남녀공용 스니커즈 오키드 핑크"]
        ]
    let eighthList = [
        ["image" : "shoes1", "price" : "25,000원원","title" : "RED VANS 윅스 [교환] "],
        ["image" : "shoes2", "price" : "45,000원원","title" : "WHITE VANS 남녀공용 화이트"],
        ["image" : "shoes3", "price" : "27,000원원","title" : "프리즘 웍스 SNSNW-04"],
        ["image" : "shoes4", "price" : "75,000원원","title" : "마크 곤잘레스 알로하 남녀공용 스니커즈 오키드 핑크"],
        ["image" : "clothes1", "price" : "23,000원원","title" : "소프트 필링 세미오버 라운드 니트 초코브라운 "]
      
        ]
    
//    private var modelList: [HomeProductsResultModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let window = UIApplication.shared.windows.first
        self.tableView.contentInset.top = -(window?.safeAreaInsets.top ?? 0)
        
        let jwt = UserDefaults.standard.string(forKey: "jwt") ?? ""
        print(jwt)
    
        setProductModel()
        setTablePresenters()
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
        
    
        
    }
    
    private func loadData() {
        APIService.shared.getHomeBanner() { [weak self] model in
            if model.code == 1000 {
                self?.bannerModel = model
                self?.setBannerModel()
            } else {
                showToast(message: model.message ?? "")
            }
        }
        APIService.shared.getHomeProducts() { [weak self] model in
            if model.code == 1000 {
                self?.productsModel = model
                self?.setProductModel()
            } else {
//                showToast(message: model.message ?? "")
            }
        }
    }
    
    private func setBannerModel() {
        firstCellPresenter.set(model: bannerModel)
        tableView.reloadData()
    }
    
    private func setProductModel() {
        thirdCellPresenter.set(model: productsModel)
        thirdCellPresenter.set(model: productsModel)
        fourthCellPresenter.set(model: fourthList)
        fifthCellPrsenter.set(model: fifthList)
        sixthCellPresenter.set(model: sixthList)
        sevenCellPresnter.set(model:sevenList)
        eighthCellPresenter.set(model: eighthList)
        secondCellPresenter.myFeedDelegate = self
        secondCellPresenter.zzimDelegate = self
        
        tableView.reloadData()
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
    
//    func cellClick(indexPath: IndexPath) {
//        guard let productId = modelList[indexPath.row].productId else {
//            return
//        }
//        let vc = Detail(productId: productId)
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
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
        print("d")
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
