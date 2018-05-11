//
//  IndexViewController.swift
//  SwiftDemo
//
//  Created by yuling on 2018/5/7.
//  Copyright © 2018年 yuling. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class IndexViewController: ViewController {
    let viewModel = RMBQuoteViewModel()
    let dis = DisposeBag()
    lazy var collectionView:UICollectionView = {
        let coll = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: UICollectionViewFlowLayout.init())
        coll.register(IndexeCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        coll.backgroundColor = mainColor
        coll.contentInset = UIEdgeInsetsMake(10, 10, 10, 10)
        coll.delegate = self
        coll.dataSource = self
        return coll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "牌价"
        self.view.backgroundColor = UIColor.white
        self.navView()
        self.view.addSubview(self.collectionView)
         loadViewModel()
        viewModel.updateList(banKCode: viewModel.bankCode).subscribe(onNext: { [weak self](code) in
            self?.loadViewModel()
        }, onError: { (error) in
            
        }, onCompleted: {
            
        }) {
            
        }.disposed(by: self.dis)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func loadViewModel() {
        viewModel.loadList().subscribe(onNext: { [weak self] (response) in
            self?.collectionView.reloadData()
        }, onError: { (error) in
            
        }, onCompleted: {
            
        }) {
            
        }.disposed(by: dis)
    }
    func navView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "All", style: UIBarButtonItemStyle.plain, target: self, action: #selector(IndexViewController.curr))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "切换银行", style: UIBarButtonItemStyle.plain, target: self, action: #selector(IndexViewController.changebank))

    }
    @objc func curr() {
        self.navigationController?.pushViewController(CurrencyCodeViewController.init(), animated: true)
    }
    @objc func changebank(){
        let bankList = BankListViewController()
        bankList.rmbQuoteViewModel = viewModel
        self.navigationController?.present(UINavigationController.init(rootViewController: bankList), animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

}
extension IndexViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return viewModel.list.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.bounds.width / 2 - 15, height: (collectionView.bounds.width / 2 - 15) * KSCALE)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell:IndexeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IndexeCollectionViewCell
        cell.setModel(model: self.viewModel.list[indexPath.row])
        
        return cell
    }
}
