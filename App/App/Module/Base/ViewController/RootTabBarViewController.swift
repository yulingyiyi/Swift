//
//  RootTabBarViewController.swift
//  App
//
//  Created by Nick on 2019/2/19.
//  Copyright © 2019 yuling. All rights reserved.
//

import UIKit

class RootTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addNavigationControllers()
        // Do any additional setup after loading the view.
    }
    func addNavigationControllers(){
        let nav = RootNavigationController.init(rootViewController: IndexViewController())
        nav.tabBarItem.title = "萌帮"
        self.addChild(nav)
        let nav1 = RootNavigationController.init(rootViewController: MeViewController())
        nav1.tabBarItem.title = "我的"
        self.addChild(nav1)
        
        
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
