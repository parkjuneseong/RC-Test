//
//  RootViewController.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//

import UIKit
 
typealias RVC = RootViewController

struct TabComponent {
   let rootViewController: UINavigationController
   let iconComponent: TabIconComponent
}

class RootViewController: UIViewController {
 
   static let shared = RootViewController(nibName: nil, bundle: nil)
   var tabbarController = TabbarViewController(nibName: nil, bundle: nil)
   static let tab = RootViewController.shared.tabbarController
    var delegate: ZZimDelegate?
   var tabBar: TabbarViewController {
       RVC.shared.tabbarController
   }
     
   override func viewDidLoad() {
       super.viewDidLoad()
       self.navigationController?.isNavigationBarHidden = true
       self.add(tabbarController, frame: self.view.bounds)
       loadControllers()
        
   }
   
   func reloadControllers() {
       if self.isViewLoaded {
           loadControllers()
       }
   }
   
   func loadControllers() {
       let VCs: [UIViewController] = [
           HomeVC(nibName: "HomeVC", bundle: nil),
           SearchVC(nibName: "SearchVC", bundle: nil),
           RegistVC(nibName: "RegistVC", bundle: nil),
           TalkVC(nibName: "TalkVC", bundle: nil),
           MyVC(nibName: "MyVC", bundle: nil)
       ]
       let tabComponents: [TabIconComponent] = [
           TabIconComponent(icon: UIImage(named: "Home") ?? UIImage(), selectedIcon: UIImage(named: "clickHome") ?? UIImage(), title: "홈"),
           TabIconComponent(icon: UIImage(named: "Search") ?? UIImage(), selectedIcon: UIImage(named: "Search") ?? UIImage(), title: "검색"),
           TabIconComponent(icon: UIImage(named: "Regist") ?? UIImage(), selectedIcon: UIImage(named: "Regist") ?? UIImage(), title: "등록"),
           TabIconComponent(icon: UIImage(named: "Talk") ?? UIImage(), selectedIcon: UIImage(named: "clickTalk") ?? UIImage(), title: "번개톡"),
           TabIconComponent(icon: UIImage(named: "My") ?? UIImage(), selectedIcon: UIImage(named: "clickMy") ?? UIImage(), title: "MY")
       ]
       tabbarController.setViewControllers(VCs, iconSet: tabComponents, animated: true)
   }
   
   override var childForStatusBarHidden: UIViewController? {
       self.tabbarController
   }
   
   override var childForStatusBarStyle: UIViewController? {
       self.tabbarController
   }
}

extension UIViewController {
   func add(_ child: UIViewController, frame: CGRect? = nil) {
       addChild(child)
       
       if let frame = frame {
           child.view.frame = frame
       } else {
           child.view.translatesAutoresizingMaskIntoConstraints = false
       }
       
       view.addSubview(child.view)
       if frame == nil {
           view.addConstraints([
               child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               child.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
               child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
           ])
       }
       child.didMove(toParent: self)
   }
   
   func remove() {
       willMove(toParent: nil)
       view.removeFromSuperview()
       removeFromParent()
   }
}

public func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14.0)) {
    guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
        return
    }
    
    let toastLabel = UILabel(frame: CGRect(x: rootViewController.view.frame.size.width/2 - 95, y: rootViewController.view.frame.size.height-100, width: 200, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    rootViewController.view.addSubview(toastLabel)
    UIView.animate(withDuration: 10.0, delay: 0.1, options: .curveEaseOut, animations: {
        toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
}
