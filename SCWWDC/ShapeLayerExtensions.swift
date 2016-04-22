//
//  ShapeLayerExtensions.swift
//  SCWWDC
//
//  Created by Sebastian Cain on 4/9/16.
//  Copyright © 2016 Sebastian Cain. All rights reserved.
//

import UIKit

extension CAShapeLayer {
    
    func addTextPath(text: String, font: UIFont) {
        
        self.geometryFlipped = true
        
        var unichars = [UniChar]("sebastiancain".utf16)
        var glyphs = [CGGlyph](count: unichars.count, repeatedValue: 0)
        let gotGlyphs = CTFontGetGlyphsForCharacters(font, &unichars, &glyphs, unichars.count)
        if gotGlyphs {
            let cgpath = CGPathCreateMutable()
            for i in 0..<glyphs.count {
                var t = CGAffineTransformMakeTranslation(CGPathGetBoundingBox(cgpath).width+20, 0)
                print("bb:\(CGPathGetBoundingBox(cgpath).width) nl:\(CGPathGetBoundingBox(cgpath).width+20)")
                CGPathAddPath(cgpath, &t, CTFontCreatePathForGlyph(font, glyphs[i], nil)!)
            }
            self.path = cgpath
        }
    }
    
    func animateStroke(duration: Double, delay: Double) {
        self.strokeColor = UIColor.whiteColor().CGColor
        self.fillColor = nil;
        self.lineWidth = 1;
        self.lineJoin = kCALineJoinRound;
        self.strokeEnd = 0
        
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = duration;
        pathAnimation.fromValue = 0
        pathAnimation.toValue = 1
        pathAnimation.fillMode = kCAFillModeForwards
        pathAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut);
        pathAnimation.beginTime = CACurrentMediaTime()+delay;
        pathAnimation.removedOnCompletion = false
        
        CATransaction.begin()
        self.addAnimation(pathAnimation, forKey: "strokeEnd")
        CATransaction.setCompletionBlock({ Void in
            //self.strokeEnd = 1
        })
        CATransaction.commit()
    }
}
