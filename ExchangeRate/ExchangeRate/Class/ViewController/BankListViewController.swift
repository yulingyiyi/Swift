//
//  BankListViewController.swift
//  ExchangeRate
//
//  Created by yuling on 2018/5/10.
//  Copyright © 2018年 yuling. All rights reserved.
//

import UIKit

class BankListViewController: ViewController {
    
    var viewModel: [[String : String]] = [["name" : "工商银行", "code" : "0"],
                                          ["name" : "招商银行", "code" : "1"],
                                          ["name" : "建设银行", "code" : "2"],
                                          ["name" : "中国银行", "code" : "3"],
                                          ["name" : "交通银行", "code" : "4"],
                                          ["name" : "农业银行", "code" : "5"]
                                          ]
    var rmbQuoteViewModel:RMBQuoteViewModel?
    var evaluationBlockCallback:((String) -> ())?
    

        
    lazy var tableView:UITableView = {
        let tab = UITableView.init(frame: self.view.bounds, style: .grouped)
        tab.delegate = self
        tab.dataSource = self
        return tab;
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "选择银行"
        self.view.addSubview(self.tableView)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(BankListViewController.diss))
        // Do any additional setup after loading the view.
    }
    @objc func diss(){
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension BankListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
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
        cell?.textLabel?.text = viewModel[indexPath.row]["name"]
        cell?.detailTextLabel?.text = viewModel[indexPath.row]["code"]
        return cell!;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let code = viewModel[indexPath.row]["code"]!
        rmbQuoteViewModel?.updateList(banKCode: code).onNext(code)
        self.dismiss(animated: true, completion: nil)
        
    }
}
