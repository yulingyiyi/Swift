//
//  IndexeCollectionViewCell.swift
//  ExchangeRate
//
//  Created by yuling on 2018/5/9.
//  Copyright © 2018年 yuling. All rights reserved.
//

import UIKit

class IndexeCollectionViewCell: UICollectionViewCell {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.red
    }
}
