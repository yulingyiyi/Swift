//
//  String+Extension.swift
//  App
//
//  Created by Nick on 2019/2/21.
//  Copyright © 2019 yuling. All rights reserved.
//

import Foundation

extension String{
    /// MD5 加密字符串
    var MD5: String {
        let cStr = self.cString(using: .utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,CC_LONG(strlen(cStr!)), buffer)
        let md5String = NSMutableString()
        for i in 0..<16 {
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
}
