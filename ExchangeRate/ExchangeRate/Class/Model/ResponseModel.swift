//
//  ResponseModel.swift
//  ExchangeRate
//
//  Created by yuling on 2018/5/9.
//  Copyright © 2018年 yuling. All rights reserved.
//

import UIKit
import ObjectMapper

class ResponseModel: Model {
    var retCode: Int?
    var msg:String?
    var result: Any?

    override func mapping(map: Map) {
        super.mapping(map: map)
        retCode <- (map["retCode"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        msg <- map["msg"]
        result <- map["result"]
    }
    
}
