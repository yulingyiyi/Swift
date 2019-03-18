//
//  ViewProtocol.swift
//  App
//
//  Created by Nick on 2019/2/19.
//  Copyright © 2019 yuling. All rights reserved.
//

import Foundation

@objc public protocol ViewProtocol{
    
    @objc optional func initData()
    @objc optional func initSubView()
    
}
