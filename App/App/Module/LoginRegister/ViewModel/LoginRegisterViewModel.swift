//
//  LoginRegisterViewModel.swift
//  App
//
//  Created by Nick on 2019/2/20.
//  Copyright © 2019 yuling. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya

enum Result {
    case ok(message:String)
    case empty
    case failed(message:String)
    var isValid:Bool {
        switch self {
        case .ok:
            return true
        default:
            return false
        }
    }
}
extension Reactive where Base: UITextField {
    var inputEnabled: Binder<Result> {
        return Binder(self.base) { owner,result  in
            owner.isEnabled = result.isValid
        }
    }
}
class LoginRegisterViewModel: ViewModel {

    let disposeBag = DisposeBag()
    /// 用户名
    let username = Variable<String>("")

    let usernameUseable:Observable<Result>
    
    
    override init() {

        usernameUseable = username.asObservable().flatMapLatest{ username  in
            return LoginRegisterViewModel.validationUserName(username).observeOn(MainScheduler.instance).catchErrorJustReturn(.failed(message: "userName检测出错")).share(replay: 1)
        }
    }
    
   static func validationUserName(_ name:String) -> Observable<Result> {
        ///用户名最小长度
        let minCharactersCount = 6
        if name.isEmpty {
            return Observable.just(Result.empty)
        }
        if name.count < minCharactersCount {
            return Observable.just(Result.failed(message: "用户名长度至少为6位"))
        }
        return Observable.just(Result.ok(message: "用户名可用"))
    }

    func login(username:String,passwd:String) {
        
    NetWorkServer.server(MultiTarget(AccountServer.isPhoneExists("15201508996"))).subscribe(onSuccess: { (response) in
            
        }, onError: { (error) in
            
        }) {
            
        }.disposed(by: disposeBag)
    }
    
}
