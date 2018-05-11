//
//  IdnexViewModelq.swift
//  ExchangeRate
//
//  Created by yuling on 2018/5/8.
//  Copyright © 2018年 yuling. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

class RMBQuoteViewModel: ViewModel {
    public  var list:[RmbquotModel] = [RmbquotModel]()
    ///中国银行
    public  var bankCode:String = "3"
    var publishSubject:PublishSubject<String>?
    
    
    func loadList() -> Observable<ResponseModel> {
            return  Observable.create({ [weak self] (observable) -> Disposable in
                let provider = MoyaProvider<APIServer>()
                let callBack = provider.request(APIServer.rmbquotQuery((self?.bankCode)!), completion: { (responseResult) in
                    switch responseResult {
                    case let .success(response):
                        do {
                            let result = try Mapper<ResponseModel>().map(JSONObject:response.mapJSON())
                            self?.list = Mapper<RmbquotModel>().mapArray(JSONArray: result?.result as! [[String : Any]])
                            observable.onNext(result!)
                        }catch let error {
                            observable.onError(error)
                        }
                    case let .failure(error):
                        observable.onError(error)
                    }
                })
                return Disposables.create {
                    callBack.cancel()
                }
            })
            
        }
    
    func updateList(banKCode:String) -> PublishSubject<String> {
        self.bankCode = banKCode
        if self.publishSubject == nil
        {
            self.publishSubject = PublishSubject<String>()
        }
        return self.publishSubject!
    }
    
        
}

