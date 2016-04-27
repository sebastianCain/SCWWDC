//
//  TitleViewController.swift
//  SCWWDC
//
//  Created by Sebastian Cain on 4/9/16.
//  Copyright © 2016 Sebastian Cain. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {

    @IBOutlet var face: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var wwdc: UILabel!
    @IBOutlet var scroll: UIButton!
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * Int64(NSEC_PER_SEC)), dispatch_get_main_queue(), { Void in
//            self.name.drawOutlineAnimatedWithLineWidth(0.7, withDuration: 3, fadeToLabel: false)
//        })
//        
        
        
        name.convertToLayer().animateStroke(3, delay: 1)
        wwdc.convertToLayer().animateStroke(3, delay: 2)
        
        let circlePath = UIBezierPath(ovalInRect: scroll.bounds)
        circlePath.applyTransform(CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(-M_PI/2)))
        circlePath.applyTransform(CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 50))
        let circleShape = CAShapeLayer()
        circleShape.frame = scroll.bounds
        circleShape.path = circlePath.CGPath
        scroll.layer.addSublayer(circleShape)
        circleShape.animateStroke(2, delay: 4)
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 25,y: 12))
        path.addLineToPoint(CGPoint(x: 25, y: 37))
        path.addLineToPoint(CGPoint(x: 15, y: 27))
        path.addLineToPoint(CGPoint(x: 25, y: 37))
        path.addLineToPoint(CGPoint(x: 35, y: 27))
        path.addLineToPoint(CGPoint(x: 25, y: 37))
        path.closePath()
        
        let shape = CAShapeLayer()
        shape.frame = scroll.bounds
        shape.path = path.CGPath
        scroll.layer.addSublayer(shape)
        shape.animateStroke(2, delay: 4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
