//
//  UIScreenExtion.swift
//  App
//
//  Created by Nick on 2019/2/19.
//  Copyright © 2019 yuling. All rights reserved.
//

import UIKit

extension UIScreen{
    /// 屏幕宽度
    static var width:CGFloat{
        return UIScreen.main.bounds.width
    }
    
    /// 屏幕高度
    static var height:CGFloat{
        return UIScreen.main.bounds.height
    }
    /// 是否是全面屏
    static var isFullScreen:Bool{
        if #available(iOS 11, *) {
            guard let w = UIApplication.shared.delegate?.window,let unwrapedWindow = w else {
                return false
            }
            if unwrapedWindow.safeAreaInsets.left > 0 ||   unwrapedWindow.safeAreaInsets.bottom > 0 {
                return true
            }
        }
        return false
    }
    /// 当前导航栏该有的高度
     var navigationBarHeight: CGFloat {
        if !UIScreen.isFullScreen && UIScreen.main.stateBarHeight == 40 {
            return 64
        }
       return UIScreen.main.stateBarHeight + 44
     }
    /// 状态栏高度
     var stateBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    /// 底部安全高度
    static var bottomSafeHeight: CGFloat {
        return isFullScreen ? 34 : 0
    }
    
    /// tab高度
    static var tabBaeHeight: CGFloat {
        return isFullScreen ? 83 : 49
    }
}
