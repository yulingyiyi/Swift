//
//  CurrencyCodeModel.swift
//  SwiftDemo
//
//  Created by yuling on 2018/5/7.
//  Copyright © 2018年 yuling. All rights reserved.
//

import UIKit
import ObjectMapper

class CurrencyCodeModel: Mappable {
//    货币代码
    var code:NSString?
//    货币名称
    var name:NSString?
    
    required init?(map: Map) {
        
    }
     func mapping(map: Map) {
        code <- map["code"]
        name <- map["name"]
    }
    
}
