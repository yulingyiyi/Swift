//
//  APIServer.swift
//  App
//
//  Created by Nick on 2019/2/19.
//  Copyright © 2019 yuling. All rights reserved.
//

import Foundation
import Moya



enum LoanServer{
    
    //    首页数据
    case  findIndex
    /*检查账户是否存在*/
//    case  isPhoneExists([String:Any])
//    //    登录
//    case  login(String,String)
//    //    注册
//    case  register(String,String)
}
extension LoanServer: TargetType {
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
          case .findIndex:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
//          case let .isPhoneExists(params):
//              return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        return NetWorkServer.headers
    }
    var path:String {
        switch self {
        case .findIndex:
            return "api/borrow/findIndex.htm"
//        case .isPhoneExists:
//            return "api/user/isPhoneExists.htm"
        }
    }
    var parameterEncoding: ParameterEncoding {
        return NetWorkServer.parameterEncoding // Send parameters as JSON in request body
    }

}
