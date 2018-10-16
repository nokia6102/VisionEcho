//
//  Day30ViewController.swift
//  VisionEcho
//
//  Created by Leon Cheng on 2018/10/16.
//  Copyright © 2018年 Leon Cheng. All rights reserved.
//

import UIKit

class Day30ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTabBarHidden(true, animated: true, duration: 1.5)
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//         self.setTabBarHidden(false, animated: true, duration: 0.5)
//    }
    override func viewWillDisappear(_ animated: Bool) {
          self.setTabBarHidden(false, animated: true, duration: 0.5)
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
