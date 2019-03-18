//
//  IndexViewModel.swift
//  App
//
//  Created by Nick on 2019/2/19.
//  Copyright © 2019 yuling. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

class IndexViewModel: ViewModel {
    let disposeBag = DisposeBag()
    
    ///view 层
    weak var viewController:IndexViewController?
    ///model层
    var indexModel:IndexModel?
    ///单利
    static let share = IndexViewModel()

    ///刷新数据
    func refresh(){
        NetWorkServer.server(MultiTarget(LoanServer.findIndex)).subscribe(onSuccess: { [weak self] (response) in
            let indexModel =  Mapper<IndexModel>().map(JSONObject: response.data)
            self?.indexModel = indexModel;
            self?.viewController?.refresh()
        }, onError: { (error) in
            
        }) {
            
        }.disposed(by: disposeBag)
    }
}

