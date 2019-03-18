//
//  IndexViewController.swift
//  App
//
//  Created by Nick on 2019/2/19.
//  Copyright © 2019 yuling. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Toast_Swift

class IndexViewController: UIViewController,ViewControllerProtocol {
    let disposeBag = DisposeBag()
    lazy var navigationbar: Navigationbar = Navigationbar.defaultNavigationbar()
    lazy var  viewMdoel = IndexViewModel.share
    
    var tf = UITextField.init()
    lazy var indexCardView = IndexCardView.init(frame: CGRect.init())
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initSubView()
//        self.indexCardView.rx.
//        tf.rx.text
        // Do any additional setup after loading the view.
    }
    func initData() {
        self.viewMdoel.viewController  = self
        self.navigationbar.titleL.text="萌帮"
        self.viewMdoel.refresh()
    }
    func refresh() {
        self.view.makeToast("success", duration: 1, position: .center)
    }
    func initSubView() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(navigationbar)
        navigationbar.backgroundColor = .red
        navigationbar.backItem.addTarget(self, action:#selector(backItemAction(_:)), for: .touchUpInside)
    }
    

    @objc func backItemAction(_ sender:NavigationItem){
      
        self.present(RegisterViewController(), animated: true) {
            
        }
//        self.present(LoginViewController(), animated: true) {
//
//        }
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
