//
//  UserServer.swift
//  App
//
//  Created by Nick on 2019/2/21.
//  Copyright © 2019 yuling. All rights reserved.
//

import UIKit
import Moya

enum AccountServer{
    //    检查账户是否存在
    case  isPhoneExists(String)
//    //    登录
//    case  login(String,String)
//    //    注册
//    case  register(String,String)
}
extension AccountServer: TargetType {
    var baseURL: URL {
        return NetWorkServer.baseURL
    }
    var sampleData: Data {
        return  NetWorkServer.sampleData
    }
    var method: Moya.Method {
        return NetWorkServer.method
    }
    var task: Task {
        switch self {
          case let .isPhoneExists(phone):
            return .requestParameters(parameters: ["phone":phone], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return NetWorkServer.headers
    }
    
    var path:String {
        switch self {
            case .isPhoneExists:
                return "api/user/isPhoneExists.htm"
        }
    }
    var parameterEncoding: ParameterEncoding {
        return NetWorkServer.parameterEncoding // Send parameters as JSON in request body
    }
    
}
