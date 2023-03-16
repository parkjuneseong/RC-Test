//
//  PayVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/15.
//

import UIKit
protocol PayDelegate : AnyObject {
    func movePay()
}

class PayVC: UIViewController {
    weak var payDelegate : PayDelegate?
    @IBOutlet weak var payPrice: UILabel!
    @IBAction func payBtn(_ sender: Any) {
        print("d")
        self.dismiss(animated: true)
        self.payDelegate?.movePay()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
