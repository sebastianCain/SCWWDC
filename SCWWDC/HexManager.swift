//
//  HexManager.swift
//  SCWWDC
//
//  Created by Sebastian Cain on 4/28/16.
//  Copyright © 2016 Sebastian Cain. All rights reserved.
//

import UIKit

class HexManager: NSObject {
    
    static func hexLayer(center: CGPoint) -> CAShapeLayer {
        let hex = UIBezierPath.roundedPolygonPathWithRect(CGRect(x: 0, y: 0, width: 100, height: 100), lineWidth: 1, sides: 6, cornerRadius: 10).CGPath
        let hexlayer = CAShapeLayer()
        hexlayer.frame = CGRect(x: center.x-50, y: center.y-50, width: 100, height: 100)
        hexlayer.path = hex
        hexlayer.fillColor = UIColor.clearColor().CGColor
        hexlayer.strokeColor = UIColor.whiteColor().CGColor
        hexlayer.lineWidth = 1
        hexlayer.strokeEnd = 1
        return hexlayer
    }
    
    static func hexPoints(s: CGFloat, sw: CGFloat, sh: CGFloat) -> [CGPoint] {
        var a = [CGPoint]()
        a.append(CGPoint(x: sw/2, y: sh/2-s))
        a.append(CGPoint(x: sw/2+sqrt(3)*s/2, y: sh/2-s/2))
        a.append(CGPoint(x: sw/2+sqrt(3)*s/2, y: sh/2+s/2))
        a.append(CGPoint(x: sw/2, y: sh/2+s))
        a.append(CGPoint(x: sw/2-sqrt(3)*s/2, y: sh/2+s/2))
        a.append(CGPoint(x: sw/2-sqrt(3)*s/2, y: sh/2-s/2))
        return a
    }
    
    static func hexLabels(hexpts: [CGPoint], hexStrings: [String]) -> [UILabel] {
        var a = [UILabel]()
        for i in 0..<6 {
            let l = UILabel()
            l.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            l.textColor = UIColor.whiteColor()
            l.textAlignment = .Center
            l.center = hexpts[i]
            l.text = hexStrings[i]
            l.font = UIFont.scwwdcThinFont(16)
            a.append(l)
        }
        return a
    }
}
