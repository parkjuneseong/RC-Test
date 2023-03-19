//
//  DetailReviewCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/19.
//

import UIKit

class DetailReviewCell: UITableViewCell {

    @IBOutlet weak var createAtTimeLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
