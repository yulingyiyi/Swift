//
//  IndexViewController.swift
//  SwiftDemo
//
//  Created by yuling on 2018/5/7.
//  Copyright © 2018年 yuling. All rights reserved.
//

import UIKit
import RxSwift

class IndexViewController: UIViewController {
    let viewModel = RMBQuoteViewModel()
    let dis = DisposeBag()
    lazy var collectionView:UICollectionView = {
        let coll = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: UICollectionViewFlowLayout.init())
        coll.register(IndexeCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        coll.backgroundColor = UIColor.white
        coll.delegate = self
        coll.dataSource = self
        return coll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "index"
        self.view.backgroundColor = UIColor.white
        self.navView()
        self.view.addSubview(self.collectionView)
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadViewModel()
    }
    func loadViewModel() {
        viewModel.loadList(bank: "1").subscribe(onNext: { [weak self] (response) in
            self?.collectionView.reloadData()
        }, onError: { (error) in
            
        }, onCompleted: {
            
        }) {
            
        }.disposed(by: dis)
    }
    func navView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "All", style: UIBarButtonItemStyle.plain, target: self, action: #selector(IndexViewController.curr))
    }
    @objc func curr() {
        self.navigationController?.pushViewController(CurrencyCodeViewController.init(), animated: true)
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
        return CGSize.init(width: collectionView.bounds.width / 2 - 5, height: collectionView.bounds.width / 2 - 5)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}
