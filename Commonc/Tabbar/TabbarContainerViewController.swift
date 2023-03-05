//
//  TabbarContainerViewController.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//

import UIKit

class TabbarContainerViewController: UIViewController {
    var tabbar: TabIconViewController
    
    init(tabbar: TabIconViewController) {
        self.tabbar = tabbar
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.add(tabbar, frame: self.view.bounds)
        self.calculatePreferredSize()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        self.calculatePreferredSize()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.calculatePreferredSize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    private func calculatePreferredSize() {
        var size = self.view.bounds.size
        let height = self.tabbar.preferredContentSize.height
        
        if let superView = self.view.superview {
            size = CGSize(width: superView.bounds.width, height: height)
        }
        
        if self.preferredContentSize != size {
            self.preferredContentSize = size
            self.view.superview?.setNeedsLayout()
        }
    }
}
