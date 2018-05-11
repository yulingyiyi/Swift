//
//  RootTabbarController.swift
//  ExchangeRate
//
//  Created by yuling on 2018/5/10.
//  Copyright © 2018年 yuling. All rights reserved.
//

import UIKit

class RootTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavViewController(navTitle: "牌价", rootViewController: IndexViewController())
        self.tabBar.barTintColor = mainColor
        // Do any additional setup after loading the view.
    }
    func  addNavViewController(navTitle:String, rootViewController:UIViewController) {
        let nav = UINavigationController.init(rootViewController: rootViewController);
        nav.tabBarItem.title = navTitle
        nav.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white], for: UIControlState.normal)
        nav.navigationBar.barTintColor = mainColor
        self.addChildViewController(nav)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
