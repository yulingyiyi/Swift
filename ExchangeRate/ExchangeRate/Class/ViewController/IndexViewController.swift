//
//  IndexViewController.swift
//  SwiftDemo
//
//  Created by yuling on 2018/5/7.
//  Copyright © 2018年 yuling. All rights reserved.
//

import UIKit


class IndexViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "index"
        
        self.view.backgroundColor = UIColor.white
        self.navView()
        // Do any additional setup after loading the view.
    }
    func navView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action:#selector(IndexViewController.curr))
    }
    @objc func curr() {
        self.navigationController?.pushViewController(CurrencyCodeViewController.init(), animated: true)
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
