//
//  MyFeedVC.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/09.
//

import UIKit

class MyFeedVC: UIViewController {
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func searchMove(_ sender: Any) {
        let vc = SearchVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var underLine1: UIView!
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var underLine2: UIView!
    
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var underLine3: UIView!
    
    @IBAction func control1Action(_ sender: Any) {
        label2.textColor = .lightGray
        label3.textColor = .lightGray
        underLine2.isHidden = true
        underLine3.isHidden = true
        label1.textColor = .black
        underLine1.backgroundColor = .black
        underLine1.isHidden = false
    }
    @IBAction func control2Action(_ sender: Any) {
        label1.textColor = .lightGray
        label3.textColor = .lightGray
        underLine1.isHidden = true
        underLine3.isHidden = true
        label2.textColor = .black
        underLine2.backgroundColor = .black
        underLine2.isHidden = false
    }
    @IBAction func control3Action(_ sender: Any) {
        label1.textColor = .lightGray
        label2.textColor = .lightGray
        underLine1.isHidden = true
        underLine2.isHidden = true
        label3.textColor = .black
        underLine3.backgroundColor = .black
        underLine3.isHidden = false
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
