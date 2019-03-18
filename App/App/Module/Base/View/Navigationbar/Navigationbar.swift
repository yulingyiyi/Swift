//
//  Navigationbar.swift
//  App
//
//  Created by Nick on 2019/2/19.
//  Copyright © 2019 yuling. All rights reserved.
//

import UIKit
import SnapKit

let NavigationbarContentHeight:CGFloat = 44.0
class NavigationItem: UIButton {
   
}

class Navigationbar: UIView,ViewProtocol {
    
    ///标题
    lazy var titleL: UILabel = {
        let l = UILabel.init()
        l.textAlignment = .center
        return l;
    }()
    ///内容
    lazy var contentView = UIView()
    
    ///返回按钮
    lazy var backItem:NavigationItem = {
        let a = NavigationItem.init()
        a.setTitle("返回", for: .normal)
        return a
    }()
    
    
    
    class func defaultNavigationbar() -> Navigationbar {
        let nav:Navigationbar = Navigationbar.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.width, height: UIScreen.main.navigationBarHeight))
        return nav;
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initData()
        initSubView()
        ///状态栏改变的时候
        NotificationCenter.default.addObserver(self, selector:#selector(didChangeStatusBarFrameNotification(_:)), name: UIApplication.didChangeStatusBarFrameNotification, object: nil)
    }
    
    @objc func didChangeStatusBarFrameNotification(_ notification:Notification){
            self.frame = CGRect.init(x: 0, y: 0, width: UIScreen.width, height: UIScreen.main.navigationBarHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initSubView() {
        addSubview(contentView)
        contentView.addSubview(titleL)
        contentView.addSubview(backItem)
        contentView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(NavigationbarContentHeight)
        }
        titleL.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        backItem.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(NavigationbarContentHeight)
        }
    }
    func initData() {
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
