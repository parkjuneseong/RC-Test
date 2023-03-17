//
//  TabbarViewController.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//


import UIKit

struct TabIconComponent {
   var icon: UIImage
   var selectedIcon: UIImage
   var title: String
}

class TabbarViewController: UIViewController {
   let tabbar = TabIconViewController(nibName: "\(TabIconViewController.self)", bundle: nil)
   
   private let tabbarHeight: CGFloat = 50
   var viewControllers: [UIViewController]?
   var tabbarContainer: TabbarContainerViewController?
   var selectedViewController: UIViewController?
   private var containerViewController = UIViewController(nibName: nil, bundle: nil)
   var selectedIndex: Int = -1 {
       willSet(newVal) {
           guard let newVC = self.viewControllers?[newVal] else {
               return
           }
           self.selectedViewController?.remove()
//            if newVC.delegate == nil {
//                newVC.delegate = self
//            }
           containerViewController.add(newVC, frame: nil)
           containerViewController.view.sendSubviewToBack(newVC.view)
           self.selectedViewController = newVC
       }
       didSet {
           tabbar.selectedButtonIndex = selectedIndex
           self.setNeedsStatusBarAppearanceUpdate()
       }
   }
   
   func setViewControllers(_ viewControllers: [UIViewController]?, iconSet: [TabIconComponent], animated: Bool) {
       guard viewControllers?.first != nil && self.isViewLoaded else {
           return
       }
       containerViewController.children.forEach {
           $0.remove()
       }
       self.viewControllers = viewControllers
       tabbar.setTabIcons(iconSet: iconSet)
       self.selectedIndex = 0
       self.tabbarContainer?.view.setNeedsLayout()
   }
   
   override func viewDidLoad() {
       super.viewDidLoad()
       
       self.add(containerViewController, frame: self.view.bounds)
       self.tabbar.delegate = self
       let tabbarContainer = TabbarContainerViewController(tabbar: tabbar)
       self.add(tabbarContainer, frame: self.view.bounds)
       self.tabbarContainer = tabbarContainer
   }
   
   override func viewDidLayoutSubviews() {
       super.viewDidLayoutSubviews()
       
       var tabbarHeight: CGFloat = 0
       if let tabbarContainer = self.tabbarContainer {
           var size = tabbarContainer.preferredContentSize
           size.height += self.view.safeAreaInsets.bottom
           let yOffset = self.view.bounds.height - size.height
           let tabbarFrame = CGRect(origin: CGPoint(x: 0, y: yOffset), size: size)
           tabbarContainer.view.frame = tabbarFrame
           tabbarHeight = tabbarContainer.preferredContentSize.height
       }
       
       let height = tabbarHeight
       let bottom = self.containerViewController.additionalSafeAreaInsets.bottom
       if height != bottom {
           self.containerViewController.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
       }
   }
   
   func detachContainer() {
       guard containerViewController.parent != nil else {
           return
       }
       containerViewController.remove()
   }
   
   func attachContainer() {
       guard containerViewController.parent == nil else {
           return
       }
       add(containerViewController)
       view.sendSubviewToBack(RVC.tab.containerViewController.view)
   }
   
   override var childForStatusBarHidden: UIViewController? {
       self.selectedViewController
   }
   
   override var childForStatusBarStyle: UIViewController? {
       self.selectedViewController
   }
}

//extension TabbarViewController: UINavigationControllerDelegate {
//    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//        <#code#>
//    }
//}

extension TabbarViewController: TabIconViewControllerDelegate {
   func selected(index: Int) {
       if index == 1 {
           guard let navigationController = self.navigationController else {
               return
           }
           let searchVc = SearchVC(nibName: "SearchVC", bundle: nil)
           navigationController.pushViewController(searchVc, animated: true)
           return
       } else if index == 2 {
//           let registVc = RegistVC(nibName: "RegistVC", bundle: nil)
            
//           self.present(registVc, animated: true)
           let detailVC = RegistVC()
           let vc = UINavigationController(rootViewController: detailVC)
           detailVC.moveRegistDelegate = self
           vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
           self.present(vc, animated: true)
            
//           navigationController?.pushViewController(registVc, animated: true)
       }else{
           self.selectedIndex = index
       }
   }
}
extension TabbarViewController : MoveRegistDelegate {
    func moveRegist() { //productId : Int
        let vc = Detail() //productId: productId
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
