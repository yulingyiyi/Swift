//
//  LoginViewController.swift
//  App
//
//  Created by Nick on 2019/2/20.
//  Copyright © 2019 yuling. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Toast_Swift

class LoginViewController: UIViewController,ViewControllerProtocol {
    let disposeBag = DisposeBag()
    lazy var navigationBar: Navigationbar = Navigationbar.defaultNavigationbar()
    lazy var  viewModel = LoginRegisterViewModel()
    lazy var  contentView = UIView()
    
    lazy var nameTF:UITextField = {
       let tf =  UITextField.init()
        tf.placeholder = "输入用户名"
        return tf
    }()
    lazy var passwdTF:UITextField = {
        let tf =  UITextField.init()
        tf.isSecureTextEntry = true
        tf.placeholder = "输入密码"
        return tf
    }()
    lazy var loginBtn:UIButton = {
        let btn =  UIButton.init()
//        btn.isEnabled = false
        btn.setTitle("登录", for: UIControlState.normal)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initSubView()
        //        self.indexCardView.rx.
        //        tf.rx.text
        // Do any additional setup after loading the view.
    }
    func initData() {
        self.navigationBar.titleL.text="登录"
        
        
//        nameTF.rx.text.orEmpty.bind(to: viewMdoel.username).disposed(by: disposeBag)
//        viewMdoel.usernameUseable.bind(to: passwdTF.rx.inputEnabled).disposed(by: disposeBag)

       loginBtn.addTarget(self, action: #selector(loginBtnClick(_:)), for: .touchUpInside)
    }
    ///登录事件
    @objc func loginBtnClick(_ sender:UIButton){
        viewModel.login(username: "", passwd: "")

    }

    
    func refresh() {
        self.view.makeToast("success", duration: 1, position: .center)
    }
    func initSubView() {
        view.backgroundColor = UIColor.backgroundColor
        navigationBar.backgroundColor = .mainThemeColor
        contentView.backgroundColor = .white
        loginBtn.backgroundColor = .mainThemeColor
        self.view.addSubview(contentView)
        self.view.addSubview(navigationBar)
        self.contentView.addSubview(nameTF)
        self.contentView.addSubview(passwdTF)
        self.view.addSubview(loginBtn)
        
        contentView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(100)
            make.height.equalTo(80);
        }

        nameTF.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(0)
            make.height.equalTo(35);
        }
        passwdTF.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.bottom.equalTo(0)
            make.height.equalTo(35);
        }
        loginBtn.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(250)
            make.height.equalTo(35);
        }
        
    }
    func name() {
        
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
