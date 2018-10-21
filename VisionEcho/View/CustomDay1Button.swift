//
//  CustomDay1Button.swift
//  VisionEcho
//
//  Created by Leon Cheng on 2018/10/21.
//  Copyright © 2018年 Leon Cheng. All rights reserved.
//

import UIKit

class CustomDay1Button: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2
        self.layer.shadowColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 3.0
       
    }


}
