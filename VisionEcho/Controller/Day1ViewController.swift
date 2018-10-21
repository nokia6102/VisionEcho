//
//  Day1ViewController.swift DayDetail
//  VisionEcho
//
//  Created by Leon Cheng on 2018/10/16.
//  Copyright © 2018年 Leon Cheng. All rights reserved.
//

import UIKit

class Day1ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    @IBOutlet weak var day1TableView: UITableView!
    let lblArray = ["Music\n音樂","Artical\n文章","Meditation\n靜心","Yoga\n瑜珈"]
    let btnImageArray = [ "01Music","02Artical","03Meditation","04Yoga"]
    let btnColorArray = [ #colorLiteral(red: 0.9215686275, green: 0.2509803922, blue: 0.9607843137, alpha: 1), #colorLiteral(red: 0.3882352941, green: 0.5215686275, blue: 0.9529411765, alpha: 1), #colorLiteral(red: 0.9215686275, green: 0.7294117647, blue: 0.0862745098, alpha: 1), #colorLiteral(red: 0.09803921569, green: 0.9058823529, blue: 0.937254902, alpha: 1)]
    
/*
//    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTabBarHidden(false)
//        refreshControl = UIRefreshControl()
//        day1TableView.addSubview(refreshControl)
    }
*/
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
    }
    
   
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        cell.viewWithTag(121)?.backgroundColor = btnColorArray[indexPath.row]
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellDay1", for: indexPath) as! Day1TableViewCell
        
        cell.lblDay.text =  lblArray[indexPath.row]
        cell.btnImageCheck.setImage(UIImage(named: btnImageArray[indexPath.row]), for: .normal)

   
        if indexPath.row % 2 == 0 {
            cell.viewData.layer.backgroundColor =  #colorLiteral(red: 0.8823529412, green: 0.862745098, blue: 0.862745098, alpha: 1)
        } else {
            cell.viewData.layer.backgroundColor =  #colorLiteral(red: 0.7647058824, green: 0.7176470588, blue: 0.7176470588, alpha: 1)
        }

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
