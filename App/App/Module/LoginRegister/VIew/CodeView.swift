//
//  CodeView.swift
//  App
//
//  Created by Nick on 2019/2/21.
//  Copyright © 2019 yuling. All rights reserved.
//

import UIKit

class CodeView: UIView {

    var verifyCode:String = "12345"
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context!.setLineWidth(CGFloat(1));
        
        var pX:CGFloat = 0.0,pY:CGFloat = 0.0
        
        for _ in 0..<5 {
            let randomCorlor = UIColor.init(red: CGFloat(arc4random()%255/255), green: CGFloat(arc4random()%255/255), blue: CGFloat(arc4random()%255/255), alpha: 0.3)
            context?.setStrokeColor(randomCorlor.cgColor)
            //起点
            pX = CGFloat(arc4random()%UInt32(rect.size.width))
            pY = CGFloat(arc4random()%UInt32(rect.size.height))
            context?.move(to: CGPoint(x: pX, y: pY))
            //终点
            pX = CGFloat(arc4random()%UInt32(rect.size.width))
            pY = CGFloat(arc4random()%UInt32(rect.size.height))
            context?.addLine(to: CGPoint(x: pX, y: pY))
            context?.strokePath();
            
        }
        for index in 0..<self.verifyCode.count {
            pX = CGFloat(Int(arc4random()) % Int(rect.size.width)) + (rect.size.width+4)/CGFloat(5) * CGFloat(index)
            
            pY = CGFloat(arc4random()%UInt32(rect.size.height))
            let point = CGPoint(x: pX, y: pY)
            let c = self.verifyCode[self.verifyCode.index(self.verifyCode.startIndex, offsetBy: index)]
            
            let textC :String = "\(c)"
            let randomFont = UIFont.systemFont(ofSize:CGFloat(arc4random()%5+15))
            textC.draw(at: point, withAttributes: [NSAttributedString.Key.font:randomFont])
        }
    }
    
}
