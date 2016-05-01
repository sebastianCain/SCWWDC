//
//  PathExtensions.swift
//  SCWWDC
//
//  Created by Sebastian Cain on 4/27/16.
//  Copyright © 2016 Sebastian Cain. All rights reserved.
//

import UIKit

extension UIBezierPath {
    static func roundedPolygonPathWithRect(square: CGRect, lineWidth: Float, sides: Int, cornerRadius: Float) -> UIBezierPath {
        let path = UIBezierPath()
        
        let theta = Float(2.0 * M_PI) / Float(sides)
        let offset = cornerRadius * tanf(theta / 2.0)
        let squareWidth = Float(min(square.size.width, square.size.height))
        
        var length = squareWidth - lineWidth
        
        if sides % 4 != 0 {
            length = length * cosf(theta / 2.0) + offset / 2.0
        }
        
        let sideLength = length * tanf(theta / 2.0)
        
        var point = CGPointMake(CGFloat((squareWidth / 2.0) + (sideLength / 2.0) - offset), CGFloat(squareWidth - (squareWidth - length) / 2.0))
        var angle = Float(M_PI)
        path.moveToPoint(point)
        
        for _ in 0 ..< sides {
            
            let x = Float(point.x) + (sideLength - offset * 2.0) * cosf(angle)
            let y = Float(point.y) + (sideLength - offset * 2.0) * sinf(angle)
            
            point = CGPointMake(CGFloat(x), CGFloat(y))
            path.addLineToPoint(point)
            
            let centerX = Float(point.x) + cornerRadius * cosf(angle + Float(M_PI_2))
            let centerY = Float(point.y) + cornerRadius * sinf(angle + Float(M_PI_2))
            
            let center = CGPointMake(CGFloat(centerX), CGFloat(centerY))
            
            let startAngle = CGFloat(angle) - CGFloat(M_PI_2)
            let endAngle = CGFloat(angle) + CGFloat(theta) - CGFloat(M_PI_2)
            
            path.addArcWithCenter(center, radius: CGFloat(cornerRadius), startAngle: startAngle, endAngle: endAngle, clockwise: true)
            
            point = path.currentPoint
            angle += theta
        }
        
        path.closePath()
        
        return path
    }
    
}
