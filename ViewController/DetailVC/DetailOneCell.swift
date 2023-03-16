//
//  DetailOneCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/11.
//

import UIKit

class DetailOneCell: UITableViewCell {

    @IBOutlet weak var detailContent: UITextView!
    @IBOutlet weak var detailProductUpdatedAtTime: UILabel!
    @IBOutlet weak var detailLocation: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailPrice: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(model : DetailModel?){
        
    }
    
}
