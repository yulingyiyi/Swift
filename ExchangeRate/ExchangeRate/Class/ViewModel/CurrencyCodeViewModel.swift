//
//  CurrencyCodeViewModel.swift
//  ExchangeRate
//
//  Created by yuling on 2018/5/8.
//  Copyright © 2018 yuling. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import ObjectMapper

class CurrencyCodeViewModel: ViewModel {
    public  var list:[CurrencyCodeModel] = [CurrencyCodeModel]()
    private let provider  = MoyaProvider<APIServer>()
    
    func loadList() -> Observable<ResponseModel> {
      return  Observable.create({ [weak self] (observable) -> Disposable in
        
                let provider = MoyaProvider<APIServer>()
                let callBack = provider.request(APIServer.currencyQuery, completion: { (responseResult) in
                    switch responseResult {
                    case let .success(response):
                        do {
                           
                            let result = try Mapper<ResponseModel>().map(JSONObject:response.mapJSON())
                            self?.list = Mapper<CurrencyCodeModel>().mapArray(JSONArray: result?.result as! [[String : Any]])
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
    

}

