//
//  TabIconView.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/05.
//

import UIKit

class TabIconView: UIView {
    
//    tabIconButton tabTitleLabel tabIconImage
       
    @IBOutlet weak var tabIconButton: UIControl!
    @IBOutlet weak var tabIconImage: UIImageView!
    
    
    @IBOutlet weak var tabTitleLabel: UILabel!
    
    private var nibName: String {
        "\(TabIconView.self)"
    }
    private var containerView = UIView()
    weak var delegate: TabIconViewControllerDelegate?
    
    var image: UIImage = UIImage()
    var selectedImage: UIImage = UIImage()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder: NSCoder) {
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
    
    func bind(image: UIImage, selectedImage: UIImage, title: String, index: Int) {
        tabIconImage.image = image
        self.image = image
        self.selectedImage = selectedImage
        tabIconButton.tag = index
        tabIconButton.addTarget(self, action: #selector(tabButtonAction(_:)), for: .touchUpInside)
        tabTitleLabel.text = title
    }
    
    @IBAction private func tabButtonAction(_ sender: UIControl) {
        let index = sender.tag
        delegate?.selected(index: index)
    }
}
