//
//  CurrencyCodeViewController.swift
//  SwiftDemo
//
//  Created by yuling on 2018/5/7.
//  Copyright © 2018年 yuling. All rights reserved.
//

import UIKit
import ObjectMapper


class CurrencyCodeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var viewModel:CurrencyCodeViewModel = CurrencyCodeViewModel.init()
    
    
   lazy var tableView:UITableView = {
    
            let tab = UITableView.init(frame: self.view.bounds, style: .grouped)
            tab.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
            tab.delegate = self
            tab.dataSource = self
            return tab;
        
    }()
    func loadList() {
        ApiNetwork.request(target: .currencyQuery, success: { (result ) in
            let usersArray = [["code": "17", "name": "梅梅"],
                              ["code": "18", "name": "李雷"]]
            
            self.viewModel.list = Mapper<CurrencyCodeModel>().mapArray(JSONArray: usersArray)
            self.tableView.reloadData()
        }) { (error) in
            print(error)
        };
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        self.loadList()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.list[indexPath.row].code! as String
        cell.detailTextLabel?.text = viewModel.list[indexPath.row].name! as String
        return cell;
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
