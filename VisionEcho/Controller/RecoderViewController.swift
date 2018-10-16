//
//  RecoderViewController.swift
//  VisionEcho
//
//  Created by Leon Cheng on 2018/10/16.
//  Copyright © 2018年 Leon Cheng. All rights reserved.
//

import UIKit

class RecoderViewController: UIViewController {
    var enRecode = true
    @IBOutlet weak var btnRecode: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapRecode(_ sender: UIButton)
    {
        print ("按下錄音鍵")
        if( enRecode )
        {
            print("呼叫錄音")
            btnRecode.alpha = 1.0
            UIView.animate(withDuration: 1.0) {
                self.btnRecode.alpha = 0.05
            }
        }
        else
        {
             print("關掉錄音")
            btnRecode.alpha = 0.05
            UIView.animate(withDuration: 1.0) {
                self.btnRecode.alpha = 1.0
            }
        }
        print (enRecode)
        enRecode = !enRecode
        print (enRecode)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
