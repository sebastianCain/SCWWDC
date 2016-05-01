//
//  DetailViewController.swift
//  SCWWDC
//
//  Created by Sebastian Cain on 4/29/16.
//  Copyright © 2016 Sebastian Cain. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var sh = CGFloat()
    var sw = CGFloat()
    
    var section = Int()
    var index = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        sh = self.view.frame.height
        sw = self.view.frame.width
        
        let content = Data.detailContent[section][index]
        self.view.addSubview(UILabel())
        let titlelbl = UILabel(frame: CGRect(x: 0, y: 40, width: sw, height: 80))
        titlelbl.textAlignment = .Center
        titlelbl.font = UIFont.scwwdcThinFont(48)
        titlelbl.text = content[0]
        titlelbl.textColor = UIColor.blackColor()
        self.view.addSubview(titlelbl)
        
        let l1 = UILabel(frame: CGRect(x: 0, y: 120, width: sw, height: 30))
        l1.textAlignment = .Center
        l1.font = UIFont.scwwdcLightFont(14)
        l1.text = content[1]
        l1.textColor = UIColor.blackColor()
        self.view.addSubview(l1)
        
        if (section != 3) {
            let l2 = UILabel(frame: CGRect(x: 40, y: 370, width: sw-80, height: 200))
            l2.textAlignment = .Center
            l2.font = UIFont.scwwdcLightFont(14)
            l2.text = content[2]
            l2.textColor = UIColor.blackColor()
            l2.numberOfLines = 0
            self.view.addSubview(l2)
            
            let imgview = UIImageView(frame: CGRect(x: sw/2-150, y: 200, width: 300, height: 200))
            imgview.contentMode = .ScaleAspectFit
            imgview.image = UIImage(named: content[0])
            self.view.addSubview(imgview)
        } else {
            let l2 = UILabel(frame: CGRect(x: 40, y: 250, width: sw-80, height: 200))
            l2.textAlignment = .Center
            l2.font = UIFont.scwwdcLightFont(16)
            l2.text = content[2]
            l2.textColor = UIColor.blackColor()
            l2.numberOfLines = 0
            self.view.addSubview(l2)
        }
        
        
        let scroll = UIButton(frame: CGRect(x: sw/2-25, y: sh-100, width: 50, height: 50))
        scroll.addTarget(self, action: #selector(self.back), forControlEvents: .TouchUpInside)
        self.view.addSubview(scroll)
        
        let path = UIBezierPath(ovalInRect: scroll.bounds)
        path.moveToPoint(CGPoint(x: 25,y: 12))
        path.addLineToPoint(CGPoint(x: 25, y: 37))
        path.addLineToPoint(CGPoint(x: 15, y: 27))
        path.addLineToPoint(CGPoint(x: 25, y: 37))
        path.addLineToPoint(CGPoint(x: 35, y: 27))
        path.addLineToPoint(CGPoint(x: 25, y: 37))
        path.closePath()
//        path.applyTransform(CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(M_PI/2)))
//        path.applyTransform(CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 50))
        
        let shape = CAShapeLayer()
        shape.frame = scroll.bounds
        shape.path = path.CGPath
        shape.fillColor = UIColor.clearColor().CGColor
        shape.strokeColor = UIColor.blackColor().CGColor
        scroll.layer.addSublayer(shape)
        
        // Do any additional setup after loading the view.
    }
    func back() {
        let transition = CATransition()
        transition.duration = 0.5;
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        transition.type = kCATransitionFromTop; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
        //transition.subtype = kCATransitionFromTop; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
        self.navigationController?.view.layer.addAnimation(transition, forKey: nil)
        self.navigationController?.popViewControllerAnimated(false)
    }

}
