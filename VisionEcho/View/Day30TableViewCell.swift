//
//  Day30TableViewCell.swift
//  VisionEcho
//
//  Created by Leon Cheng on 2018/10/17.
//  Copyright © 2018年 Leon Cheng. All rights reserved.
//

import UIKit

class Day30TableViewCell: UITableViewCell {
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var viewData: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
