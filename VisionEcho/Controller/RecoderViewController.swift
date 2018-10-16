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
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.setTabBarHidden(true, animated: animated, duration: 1.5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTabBarHidden(true, animated: true, duration: 1.5)
    }
    
    @IBAction func tapRecode(_ sender: UIButton)
    {
        print ("按下錄音鍵")
        if( enRecode )
        {
            print("呼叫錄音")
            UIView.animate(withDuration: 1.0) {
                self.btnRecode.alpha = 1.0
            }
        }
        else
        {
             print("關掉錄音")
            UIView.animate(withDuration: 1.0) {
                self.btnRecode.alpha = 0.3
            }
        }
        enRecode = !enRecode
        
        //檢查錄音檔
        //recodeFileisExist
        
    }
    

    
    override func viewWillDisappear(_ animated: Bool) {
         self.setTabBarHidden(false, animated: animated, duration: 0.5)
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
