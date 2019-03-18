//
//  Server.swift
//  App
//
//  Created by Nick on 2019/2/21.
//  Copyright © 2019 yuling. All rights reserved.
//

import UIKit
import Moya
import ObjectMapper
import RxSwift

///添加参数到header
final class HTTPHeaderFieldPlugin: PluginType {
    //准备发起请求
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request


        let ( sign,body ) = HTTPHeaderFieldPlugin.parameter(data: request.httpBody ?? Data())

        //重置bodys
        request.httpBody = body
        //将token添加到请求头中
        request.addValue(sign, forHTTPHeaderField: "signMsg")
        request.addValue("1", forHTTPHeaderField: "mobileType")
        request.addValue(UserDefaults.standard.string(forKey: KUserId) ?? "", forHTTPHeaderField: "userId")
        request.addValue(UserDefaults.standard.string(forKey: KToken)  ?? "", forHTTPHeaderField: "token")
        request.addValue(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String, forHTTPHeaderField: "versionNumber")
        return request
    }

    ///解析body的参数
    class func parameter(data:Data) -> (sign:String,body:Data) {

        var parameters:[String:String] = [:]

        let str:String = String(data: data, encoding: String.Encoding.utf8) ?? ""
        let pars:[String] = str.components(separatedBy: "&")

        for parStr in pars {
            let parss:[String] = parStr.components(separatedBy: "=")
            if parss.count == 2 {
              parameters = parameters.merging([parss[0] : parss[1]]) { (s1, s2) -> String in
                    return s2
                }
            }
        }


        ////添加公共参数

        let publicparameters:[String:String] = ["mobileType" : "1",
                                                "versionNumber" : Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String,
                                                "userId" : UserDefaults.standard.string(forKey: KUserId) ?? ""];

        parameters = parameters.merging(publicparameters) { (s1, s2) -> String in
            return s2
        }

        ///pau排序
        let resultKeys:[String] = parameters.keys.sorted { (str1, str2) -> Bool in
            return str1 < str2
        }
        var parStr = ""
        var signStr = ""
        for par in resultKeys {
            parStr.append(par)
            signStr.append(par)
            parStr.append("=")
            signStr.append("=")
            parStr.append(parameters[par] ?? "")
            signStr.append(parameters[par] ?? "")
            if resultKeys.last != par {
                parStr.append("&")
                signStr.append("|")
            }
        }
        ///用户token
        let  token:String = UserDefaults.standard.string(forKey: KToken) ?? ""

        ///加密
        signStr = "".appending(KAppKey).appending(token).appending(signStr).MD5.uppercased()


        print("\(parStr)+\(signStr)")
        return (signStr,parStr.data(using: String.Encoding.utf8) ?? Data())
    }

}
///单利
let provider = MoyaProvider<MultiTarget>(plugins: [HTTPHeaderFieldPlugin.init()])

final class NetWorkServer{
    
    class var baseURL: URL {
        return URL.init(string: "http://192.168.64.24:8080/cashloan-api/")!
    }
    class var sampleData: Data {
        return  "".data(using: .utf8)!
    }
    class var method: Moya.Method {
        return .post
    }
    class var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    class var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default // Send parameters as JSON in request body
    }
    
     static func server(_ apiServer:MultiTarget) -> Maybe<Response> {
        return Maybe.create{ maybe in
             let callBack = provider.request(apiServer, completion: { (responseResult) in
                    switch responseResult {
                        case let .success(response):
                            do {
                                let result = try Mapper<Response>().map(JSONObject:response.mapJSON())
                                  maybe(.success(result!))
                            }catch let error {
                                maybe(.error(error))
                            }
                        case let .failure(error):
                             maybe(.error(error))
                    }
                })
                return Disposables.create {
                    callBack.cancel()
                }
            }
    }
}





