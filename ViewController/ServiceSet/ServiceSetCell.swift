//
//  ServiceSetCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/15.
//

import UIKit

class ServiceSetCell: UITableViewCell {
     
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var setLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(label : String){
        setLabel.text = label
    }
    
}
