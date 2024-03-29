//
//  SetDetailHeaderView.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/14.
//

import UIKit

class SetDetailHeaderView: UIView {
    private var nibName: String {
        "\(SetDetailHeaderView.self)"
    }
    private var containerView = UIView()
    
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    @IBOutlet weak var headerLabel: UILabel!
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


