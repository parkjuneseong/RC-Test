//
//  CommonTablePresent.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

protocol CommonTablePresenter {
   var numberOfSections: Int { get }
   var numberOfRows: Int { get }
   var headerView: UIView? { get set }
   var footerView: UIView? { get }
   var headerHeight: CGFloat { get set }
   var footerHeight: CGFloat { get }

   func registerCell(to tableView: UITableView)
   func numberOfRows(in section: Int) -> Int
   func height(at indexPath: IndexPath) -> CGFloat
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell?
   func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
   func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
   func removeAllModel()
}
   
// MARK: - Optionals
extension CommonTablePresenter {
   var numberOfSections: Int {
       1
   }

   var numberOfRows: Int {
       0
   }

   var headerView: UIView? {
       get {
           nil
       }
       set {
           headerView = newValue
       }
   }

   var footerView: UIView? {
       nil
   }

   var headerHeight: CGFloat {
       get {
           .leastNormalMagnitude
       }
       set {
           headerHeight = newValue
       }
   }

   var footerHeight: CGFloat {
       .leastNormalMagnitude
   }

   func removeAllModel() {
   }

   func numberOfRows(in section: Int) -> Int {
       numberOfRows
   }

   func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
   }

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   }

   func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
       UITableView.automaticDimension
   }
}
