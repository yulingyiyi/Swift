//
//  IndexModel.swift
//  App
//
//  Created by Nick on 2019/2/19.
//  Copyright © 2019 yuling. All rights reserved.
//

import ObjectMapper

class IndexModel: ModelMapper {
    var title:String?
    override func mapping(map: Map) {
        title <- map["title"]
    }
}
