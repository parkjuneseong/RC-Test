//
//  TalkHeaderView.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//

import UIKit

class TalkHeaderView: UIView {
    private var nibName: String {
        "\(TalkHeaderView.self)"
    }
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var headerImage: UIImageView!
    
    @IBOutlet weak var adverTitle: UILabel!
    
    @IBOutlet weak var adverTitle2: UILabel!
    
    @IBOutlet weak var adverImage: UIImageView!
    
    @IBOutlet weak var lowImage: UIImageView!
    
    @IBOutlet weak var lowLabel1: UILabel!
    
    @IBOutlet weak var lowLabel2: UILabel!
    
    
    @IBOutlet weak var lowImage2: UIImageView!
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


