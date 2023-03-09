//
//  SecondCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/04.
//

import UIKit

protocol MyFeedDelegate: AnyObject {
    func moveMyFeed()
    
}
class SecondCell: UITableViewCell {
    weak var myFeedDelegate : MyFeedDelegate?
    weak var zzimDelegate : ZZimDelegate?
    @IBOutlet weak var slot1: UIControl!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var navi = UINavigationController()
    
    @IBAction func zzimMove(_ sender: Any) {
        zzimDelegate?.zzimAction()
    }
    @IBAction func moveMyFeed(_ sender: Any) {
        myFeedDelegate?.moveMyFeed()
    }
    @IBAction func slot1click(_ sender: Any) {
        
        let vc = TalkVC()
        
    }
}
