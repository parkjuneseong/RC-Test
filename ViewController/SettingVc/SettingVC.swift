//
//  SettingVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/14.
//

import UIKit

protocol SetDelegate : AnyObject{
    func moveSetDetail()
}
class SettingVC: UIViewController {
    weak var setDelegate : SetDelegate?
    @IBAction func setDetailBtn(_ sender: Any) {
        print("성공")
        self.dismiss(animated: true)
        self.setDelegate?.moveSetDetail()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

 

}
