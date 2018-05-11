//
//  RmbquotModel.swift
//  SwiftDemo
//
//  Created by yuling on 2018/5/7.
//  Copyright © 2018 yuling. All rights reserved.
//

import ObjectMapper

class RmbquotModel: Model {
//    银行代码
    var bank:String?
//    银行折算价(中间价)
    var bankConversionPri:String?
//    银行名称
    var bankName:String?
//    币种代码
    var currencyCode:String?
//    币种名称
    var currencyName:String?
//    发布日期
    var date:String?
//    现汇买入价
    var fBuyPri:String?
//    现汇卖出价
    var fSellPri:String?
//   现钞买入价
    var mBuyPri:String?
//   现钞卖出价
    var mSellPri:String?
//    发布时间
    var time:String?

    override func mapping(map: Map) {
        bank <- map["bank"]
        bankConversionPri <- map["bankConversionPri"]
        bankName <- map["bankName"]
        currencyCode <- map["currencyCode"]
        currencyName <- map["currencyName"]
        date <- map["date"]
        fBuyPri <- map["fBuyPri"]
        fSellPri <- map["fSellPri"]
        mBuyPri <- map["mBuyPri"]
        mSellPri <- map["mSellPri"]
    }
    
}
