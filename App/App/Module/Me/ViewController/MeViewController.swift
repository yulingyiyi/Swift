//
//  MeViewController.swift
//  App
//
//  Created by Nick on 2019/2/19.
//  Copyright © 2019 yuling. All rights reserved.
//

import UIKit

class MeViewController: UIViewController,ViewControllerProtocol {
    lazy var navigationbar: Navigationbar = Navigationbar.defaultNavigationbar()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func initSubView() {
        self.navigationbar.titleL.text="我的"
    }
    func initData() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(navigationbar)
        navigationbar.backgroundColor = .red
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
