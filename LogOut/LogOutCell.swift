//
//  LogOutCell.swift
//  RC Test
//
//  Created by 박준성 on 2023/03/15.
//

import UIKit

class LogOutCell: UITableViewCell {

    @IBOutlet weak var setLabel: UILabel!
     
    @IBAction func logOutBtn(_ sender: Any) {
        print("click")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(label : String){
        setLabel.text = label
    }
    
}
