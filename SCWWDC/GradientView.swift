//
//  GradientView.swift
//  Get Rept
//
//  Created by Sebastian Cain on 4/2/16.
//  Copyright © 2016 Avery Lamp. All rights reserved.
//
import UIKit

class GradientView: UIView {
    
    
    
    override func drawRect(rect: CGRect) {
        super.drawRect(frame)
        
        let color1 = UIColor(hexString: "16a085")
        let color2 = UIColor(hexString: "27ae60")
        let color3 = UIColor(hexString: "2980b9")
        let color4 = UIColor(hexString: "c0392b")
        let color5 = UIColor(hexString: "8e44ad")
        
        //2 - get the current context
        let context = UIGraphicsGetCurrentContext()
        let colors = [color1.CGColor, color2.CGColor, color3.CGColor, color4.CGColor, color5.CGColor]
        
        //3 - set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        //4 - set up the color stops
        let colorLocations:[CGFloat] = [0.0, 0.25, 0.5, 0.75, 1.0]
        
        //5 - create the gradient
        let gradient = CGGradientCreateWithColors(colorSpace,
                                                  colors,
                                                  colorLocations)
        
        //6 - draw the gradient
        let startPoint = CGPoint(x:self.frame.width/2, y: 0)
        let endPoint = CGPoint(x:self.frame.width, y:self.frame.height)
        CGContextDrawLinearGradient(context,
                                    gradient,
                                    startPoint,
                                    endPoint,
                                    [])
    }
}
