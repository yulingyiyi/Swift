//
//  ReigisterViewController.swift
//  App
//
//  Created by Nick on 2019/2/20.
//  Copyright © 2019 yuling. All rights reserved.
//
import UIKit
import RxSwift
import RxCocoa
import Toast_Swift

class RegisterViewController: UIViewController,ViewControllerProtocol {
//    let disposeBag = DisposeBag()
    lazy var navigationbar: Navigationbar = Navigationbar.defaultNavigationbar()
    lazy var codeView: CodeView = CodeView()
    
//    lazy var  viewMdoel = IndexViewModel.share
    
//    var tf = UITextField.init()
//    lazy var indexCardView = IndexCardView.init(frame: CGRect.init())
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initSubView()
        //        self.indexCardView.rx.
        //        tf.rx.text
        // Do any additional setup after loading the view.
    }
    func initData() {
//        self.viewMdoel.viewController  = self
        self.navigationbar.titleL.text="注册"
//        self.viewMdoel.refesh()
    }
    func refresh() {
        self.view.makeToast("success", duration: 1, position: .center)
    }
    func initSubView() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(navigationbar)
        self.view.addSubview(codeView)
        codeView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50);
        }
        
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
