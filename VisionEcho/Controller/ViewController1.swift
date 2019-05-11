//
//  ViewController.swift
//  BＭIBattle
//
//  Created by user on 2019/5/11.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageViewController = segue.destination as? PageViewController {
            
            // 代理 pageViewController
            pageViewController.pageViewControllerDelegate = self
        }
    }
    
}

extension ViewController1: PageViewControllerDelegate {
    
    /// 設定總頁數
    ///
    /// - Parameters:
    ///   - pageViewController: _
    ///   - numberOfPage: _
    func pageViewController(_ pageViewController: PageViewController, didUpdateNumberOfPage numberOfPage: Int) {
        self.pageControl.numberOfPages = numberOfPage
    }
    
    /// 設定切換至第幾頁
    ///
    /// - Parameters:
    ///   - pageViewController: _
    ///   - pageIndex: _
    func pageViewController(_ pageViewController: PageViewController, didUpdatePageIndex pageIndex: Int) {
        self.pageControl.currentPage = pageIndex
    }

    
}

