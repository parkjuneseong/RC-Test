//
//  MyHeaderView.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/06.
//

import UIKit

class MyHeaderView: UIView {
    private var nibName: String {
        "\(MyHeaderView.self)"
    }
     
    @IBOutlet weak var control1: UIControl!
    
    @IBOutlet weak var control2: UIControl!
    
    
    @IBOutlet weak var control3: UIControl!
    var zzimDelegate : ZZimDelegate?
    
    @IBAction func btnAction3(_ sender: Any) {
         
        zzimDelegate?.zzimAction()
     
    }
    
    
    @IBOutlet weak var headerLabel1 : UILabel!
    
    @IBOutlet weak var headerLabel2: UILabel!
    
    @IBOutlet weak var headerLabel3: UILabel!
    private var containerView = UIView()
    
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
   
    required init?  (coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
    
    private func loadNib() {
        guard let loadedNib = Bundle.main.loadNibNamed(nibName, owner: self, options: nil) else {
            return
        }
        containerView = loadedNib.first as? UIView ?? UIView()
        containerView.frame = bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(containerView)
        customViewDidLoad()
    }
    
    private func customViewDidLoad() {
    }
}
 
