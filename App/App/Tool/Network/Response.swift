//
//  Response.swift
//  App
//
//  Created by Nick on 2019/2/19.
//  Copyright © 2019 yuling. All rights reserved.
//

import Foundation
import ObjectMapper

class Response: ModelMapper {
    var code: Int?
    var msg:String?
    var data: Any?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        code <- map["code"]
        msg <- map["msg"]
        data <- map["data"]
    }
    
}
