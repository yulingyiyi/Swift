//
//  IndexeCollectionViewCell.swift
//  ExchangeRate
//
//  Created by yuling on 2018/5/9.
//  Copyright © 2018年 yuling. All rights reserved.
//

import UIKit
import SnapKit

class IndexeCollectionViewCell: UICollectionViewCell {
    
    var model:RmbquotModel?
    
    lazy var currencyNameL:UILabel = {
       let L = UILabel.init()
        L.textAlignment = NSTextAlignment.center
        L.numberOfLines = 2
        L.font = UIFont.systemFont(ofSize: 15.0)
        return L
    }()
    
    lazy var fBuyPriL:UILabel = {
        let L = UILabel.init()
        L.textAlignment = NSTextAlignment.right
        L.font = UIFont.systemFont(ofSize: 13)
        return L
    }()
    
    lazy var mBuyPriL:UILabel = {
        let L = UILabel.init()
        L.textAlignment = NSTextAlignment.right
         L.font = UIFont.systemFont(ofSize: 13)
        return L
    }()
    
    lazy var fSellPriL:UILabel = {
        let L = UILabel.init()
        L.textAlignment = NSTextAlignment.right
         L.font = UIFont.systemFont(ofSize: 13)
        return L
    }()
    
    lazy var mSellPriL:UILabel = {
        let L = UILabel.init()
        L.textAlignment = NSTextAlignment.right
         L.font = UIFont.systemFont(ofSize: 13)
        return L
    }()
    
    lazy var bankConversionPriL:UILabel = {
        let L = UILabel.init()
        L.textAlignment = NSTextAlignment.right
         L.font = UIFont.systemFont(ofSize: 13)
        return L
    }()
    
    lazy var fBuyPriNameL:UILabel = {
        let L = UILabel.init()
         L.text = "汇买价"
        L.font = UIFont.systemFont(ofSize: 13)
        L.textAlignment = NSTextAlignment.left
        return L
    }()
    
    lazy var mBuyPriNameL:UILabel = {
        let L = UILabel.init()
         L.text = "钞买价"
         L.font = UIFont.systemFont(ofSize: 13)
        L.textAlignment = NSTextAlignment.left
        return L
    }()
    
    lazy var fSellPriNameL:UILabel = {
        let L = UILabel.init()
         L.text = "汇卖价"
         L.font = UIFont.systemFont(ofSize: 13)
        L.textAlignment = NSTextAlignment.left
        return L
    }()
    
    lazy var mSellPriNameL:UILabel = {
        let L = UILabel.init()
         L.text = "钞卖价"
         L.font = UIFont.systemFont(ofSize: 13)
        L.textAlignment = NSTextAlignment.left
        return L
    }()
    
    lazy var bankConversionPriNameL:UILabel = {
        let L = UILabel.init()
        L.text = "中间价"
         L.font = UIFont.systemFont(ofSize: 13)
        L.textAlignment = NSTextAlignment.left
        return L
    }()
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.contentView.addSubview(self.currencyNameL)
        
        self.contentView.addSubview(self.fBuyPriNameL)
        self.contentView.addSubview(self.mBuyPriNameL)
        self.contentView.addSubview(self.fSellPriNameL)
        self.contentView.addSubview(self.mSellPriNameL)
        self.contentView.addSubview(self.bankConversionPriNameL)
        
        self.contentView.addSubview(self.fBuyPriL)
        self.contentView.addSubview(self.mBuyPriL)
        self.contentView.addSubview(self.fSellPriL)
        self.contentView.addSubview(self.mSellPriL)
        self.contentView.addSubview(self.bankConversionPriL)

        currencyNameL.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self.contentView)
            make.height.equalTo(50 * KSCALE)
        }
        fBuyPriNameL.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.top.equalTo(self.currencyNameL.snp.bottom)
            make.height.equalTo(25*KSCALE)
        }
        mBuyPriNameL.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.top.equalTo(self.fBuyPriNameL.snp.bottom)
            make.height.equalTo(25*KSCALE)
        }
        fSellPriNameL.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.top.equalTo(self.mBuyPriNameL.snp.bottom)
            make.height.equalTo(25*KSCALE)
        }
        mSellPriNameL.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.top.equalTo(self.fSellPriNameL.snp.bottom)
            make.height.equalTo(25*KSCALE)
        }
        bankConversionPriNameL.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.top.equalTo(self.mSellPriNameL.snp.bottom)
            make.height.equalTo(25*KSCALE)
        }
        
        fBuyPriL.snp.makeConstraints { (make) in
            make.right.equalTo(-5)
            make.top.equalTo(self.currencyNameL.snp.bottom)
            make.height.equalTo(25*KSCALE)
        }
        mBuyPriL.snp.makeConstraints { (make) in
            make.right.equalTo(-5)
            make.top.equalTo(self.fBuyPriL.snp.bottom)
            make.height.equalTo(25*KSCALE)
        }
        fSellPriL.snp.makeConstraints { (make) in
            make.right.equalTo(-5)
            make.top.equalTo(self.mBuyPriL.snp.bottom)
            make.height.equalTo(25*KSCALE)
        }
        mSellPriL.snp.makeConstraints { (make) in
            make.right.equalTo(-5)
            make.top.equalTo(self.fSellPriL.snp.bottom)
            make.height.equalTo(25*KSCALE)
        }
        bankConversionPriL.snp.makeConstraints { (make) in
            make.right.equalTo(-5)
            make.top.equalTo(self.mSellPriL.snp.bottom)
            make.height.equalTo(25*KSCALE)
        }
    }
    func setModel(model:RmbquotModel) {
        self.model = model
        self.currencyNameL.text = (self.model?.currencyName)! + (self.model?.currencyCode)! + "\n" + (self.model?.bankName)!
        self.fBuyPriL.text = self.model?.fBuyPri
        self.mBuyPriL.text = self.model?.mBuyPri
        self.fSellPriL.text = self.model?.fSellPri
        self.mSellPriL.text = self.model?.mSellPri
        self.bankConversionPriL.text = self.model?.bankConversionPri

    }
}
