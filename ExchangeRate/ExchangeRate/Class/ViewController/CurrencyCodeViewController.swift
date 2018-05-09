//
//  CurrencyCodeViewController.swift
//  SwiftDemo
//
//  Created by yuling on 2018/5/7.
//  Copyright © 2018年 yuling. All rights reserved.
//

import UIKit
import ObjectMapper


class CurrencyCodeViewController: UIViewController {

    var viewModel:CurrencyCodeViewModel = CurrencyCodeViewModel.init()
    
    
   lazy var tableView:UITableView = {
            let tab = UITableView.init(frame: self.view.bounds, style: .grouped)
            tab.delegate = self
            tab.dataSource = self
            return tab;
        
    }()
    func loadList() {
        ApiNetwork.request(target: .currencyQuery, success: { (result ) in
            self.viewModel.list = Mapper<CurrencyCodeModel>().mapArray(JSONArray: result.result as! [[String : Any]])
            self.tableView.reloadData()
        }) { (error) in
            print(error)
        };
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "货币汇总"
        self.view.addSubview(self.tableView)
        self.loadList()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension CurrencyCodeViewController: UITableViewDelegate, UITableViewDataSource{
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.list.count
        }
        func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let identifier = "cell"
    
            var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier)
            if cell == nil {
                cell = UITableViewCell.init(style: .value1, reuseIdentifier: identifier)
                cell?.accessoryType = .disclosureIndicator
            }
            cell?.textLabel?.text = viewModel.list[indexPath.row].code! as String
            cell?.detailTextLabel?.text = viewModel.list[indexPath.row].name! as String
            return cell!;
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
}
