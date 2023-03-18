//
//  UIView+Ancestor.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/18.
//

import UIKit

extension UIView {
    var ancestorTableView: UITableView? {
        ancestorView()
    }

    var ancestorCollectionView: UICollectionView? {
        ancestorView()
    }

    func ancestorView<T: UIView>() -> T? {
        var view = superview
        while view != nil && !(view is T) {
            view = view?.superview
        }

        return view as? T
    }
}
