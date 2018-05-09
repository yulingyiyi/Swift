//
//  APIManager.swift
//  ExchangeRate
//
//  Created by yuling on 2018/5/8.
//  Copyright © 2018年 yuling. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

let MobAppkey: NSString = "25a4122e2b34f"

// 网络请求结构体
struct ApiNetwork {
    // 请求成功的回调
    typealias successCallback = (_ result: ResponseModel) -> Void
    // 请求失败的回调
    typealias failureCallback = (_ error: MoyaError) -> Void
    
    // 单例
    static let provider = MoyaProvider<APIServer>()
    // 发送网络请求
    static func request(
        target: APIServer,
        success: @escaping successCallback,
        failure: @escaping failureCallback
        ) {
        provider.request(target) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    try success(Mapper<ResponseModel>().map(JSONObject:moyaResponse.mapJSON())!) // 测试用JSON数据
                    
                } catch {
                    
                    failure(MoyaError.jsonMapping(moyaResponse))
                }
            case let .failure(error):
                failure(error)
            }
        }
    }
}


enum APIServer {
    
    
//    人民币汇率数据查询
    case  rmbquotQuery(String)
//    查询主要国家的货币代码和名称
    case currencyQuery
//    根据货币代码(两个国家汇率代码)查询汇率数据
    case codeQuery(String)
//    分页查询实时汇率数据
    case query(Int,Int)
}

extension APIServer: TargetType {
    
    
    var baseURL: URL {
        return URL.init(string: "http://apicloud.mob.com/exchange/")!
    }
    var sampleData: Data {
        return  "".data(using: .utf8)!
    }
    var method: Moya.Method {
        return .get
    }
    var task: Task {
        switch self {
            case let .rmbquotQuery(code):
                return .requestParameters(parameters: ["key" : MobAppkey,"code" : code], encoding: URLEncoding.default)
            case .currencyQuery:
                return .requestParameters(parameters: ["key" : MobAppkey], encoding: URLEncoding.default)
            case let .codeQuery(code):
                return .requestParameters(parameters: ["key" : MobAppkey, "code" : code], encoding: URLEncoding.default)
            case let .query( page, size):
                return .requestParameters(parameters: ["key" : MobAppkey, "page" : page, "size": size], encoding: URLEncoding.default)
        }
    }
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
    var path:String {
        switch self {
            case .rmbquotQuery(_):
                return "rmbquot/query"
            case .currencyQuery:
                return "currency/query"
            case .codeQuery(_):
                return "code/query"
            case .query(_,_):
                return "query"
        }
    }
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default // Send parameters as JSON in request body
    }
    
}

