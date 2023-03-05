//
//  TabIconViewController.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//

import UIKit

protocol TabIconViewControllerDelegate: AnyObject {
   func selected(index: Int)
}

class TabIconViewController: UIViewController {
   @IBOutlet weak var stackView: UIStackView!
   private var tabButtons: [TabIconView] = []
   weak var delegate: TabIconViewControllerDelegate?
   
   var selectedButtonIndex: Int = 0 {
       didSet {
           for (index, button) in tabButtons.enumerated() {
               if selectedButtonIndex == index {
                   button.tabIconImage.image = button.selectedImage
               } else {
                   button.tabIconImage.image = button.image
               }
           }
       }
   }
   
   override func viewDidLoad() {
       super.viewDidLoad()
   }
   
   func setTabIcons(iconSet: [TabIconComponent]) {
       guard self.isViewLoaded else {
           return
       }
       self.stackView.safelyRemoveArrangedSubviews()
       self.tabButtons.removeAll()
       for (index, icon) in iconSet.enumerated() {
           let iconView = TabIconView(frame: .zero)
           iconView.bind(image: icon.icon, selectedImage: icon.selectedIcon, title: icon.title, index: index)
           iconView.delegate = self.delegate
           self.tabButtons.append(iconView)
           self.stackView.addArrangedSubview(iconView)
       }
       self.view.setNeedsLayout()
   }
   
   private func calculatePreferredSize() {
       let size = stackView.bounds.size
       if self.preferredContentSize != size {
           self.preferredContentSize = size
       }
   }
   
   @IBAction private func tabButtonAction(_ sender: UIButton) {
       let index = sender.tag
       delegate?.selected(index: index)
   }
   
   override func viewSafeAreaInsetsDidChange() {
       super.viewSafeAreaInsetsDidChange()
       self.calculatePreferredSize()
   }
   
   override func viewDidLayoutSubviews() {
       super.viewDidLayoutSubviews()
       self.calculatePreferredSize()
   }
}

extension UIStackView {
   func safelyRemoveArrangedSubviews() {
       let removedSubviews = arrangedSubviews.reduce(into: [UIView]()) { sum, next in
           self.removeArrangedSubview(next)
           sum.append(next)
       }
       NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
       removedSubviews.forEach({ $0.removeFromSuperview() })
   }
}
