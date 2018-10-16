//
//  Intro3ViewController.swift
//  VisionEcho
//
//  Created by Leon Cheng on 2018/10/15.
//  Copyright © 2018年 Leon Cheng. All rights reserved.
//

import UIKit

class Intro3ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        _ = Timer.scheduledTimer(timeInterval: 2.2, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
    }
    @objc func timeToMoveOn() {
        self.performSegue(withIdentifier: "goToMain", sender: self)
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
