//
//  Day30ViewController.swift
//  VisionEcho
//
//  Created by Leon Cheng on 2018/10/16.
//  Copyright © 2018年 Leon Cheng. All rights reserved.
//

import UIKit

class MysetViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidAppear(_ animated: Bool) {
        self.setTabBarHidden(true, animated: animated, duration: 1.5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
          self.setTabBarHidden(false, animated: animated, duration: 0.5)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Day30TableViewCell
        
        cell.lblDay.text = "第\(Day30ViewController.intIntoString(number: indexPath.row+1))天"
      
        let btnImage:UIImage?
        let Days = 15
        if indexPath.row <= Days-1
        {
            btnImage = UIImage(named: "Day30Check")
        }
        else
        {
            btnImage = UIImage(named: "Day30UnCheck")
        }
        
        if indexPath.row % 2 == 0 {
            cell.viewData.layer.backgroundColor =  #colorLiteral(red: 0.8823529412, green: 0.862745098, blue: 0.862745098, alpha: 1)
        
        } else {
            cell.viewData.layer.backgroundColor =  #colorLiteral(red: 0.7647058824, green: 0.7176470588, blue: 0.7176470588, alpha: 1)
        }
        
        
        cell.btnCheck.setImage(btnImage , for: UIControl.State.normal)
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (indexPath.row)
       
    }
    
    static func intIntoString(number: Int) -> String
    {
        
        
       // NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans"];
     
        let locale : Locale = NSLocale(localeIdentifier: "zh_Hant") as Locale
         let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = NumberFormatter.Style(rawValue: UInt(CFNumberFormatterRoundingMode.roundHalfDown.rawValue))!
        let string:String = formatter.string(from: NSNumber(value: number))!
    return string
    }

    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        self.setTabBarHidden(false, animated: true, duration: 0.5)
//    }
 

}
