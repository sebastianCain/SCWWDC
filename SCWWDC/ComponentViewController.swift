//
//  ComponentViewController.swift
//  SCWWDC
//
//  Created by Sebastian Cain on 4/25/16.
//  Copyright © 2016 Sebastian Cain. All rights reserved.
//

import UIKit

class ComponentViewController: UIViewController {
    
    var layers = [CAShapeLayer]();
    
    var labelStrings = [String]()
    var hexStrings = [String]()
    var hexpts = [CGPoint]()
    
    var sh = CGFloat()
    var sw = CGFloat()
    var alertController: UIAlertController?

    func setStrokeEnds(end: CGFloat) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clearColor()
        sh = self.view.frame.height
        sw = self.view.frame.width
        hexpts = HexManager.hexPoints(96, sw: sw, sh: sh)
        
    }
    
    func setup(index: Int) {
        super.viewDidLoad()
        
        labelStrings = Data.labelStrings[index]
        self.view.addSubview(UILabel())
        let titlelbl = UILabel(frame: CGRect(x: 0, y: 0, width: sw, height: 120))
        titlelbl.textAlignment = .Right
        titlelbl.font = UIFont.scwwdcThinFont(48)
        titlelbl.text = labelStrings[0]
        titlelbl.textColor = UIColor.whiteColor()
        self.view.addSubview(titlelbl)
        layers.append(titlelbl.convertToLayer())
        
        let l1 = UILabel(frame: CGRect(x: 0, y: 120, width: sw, height: 30))
        l1.textAlignment = .Center
        l1.font = UIFont.scwwdcExtraLightFont(14)
        l1.text = labelStrings[1]
        l1.textColor = UIColor.whiteColor()
        self.view.addSubview(l1)
        layers.append(l1.convertToLayer())
        
        let l2 = UILabel(frame: CGRect(x: 0, y: sh-150, width: sw, height: 30))
        l2.textAlignment = .Center
        l2.font = UIFont.scwwdcExtraLightFont(14)
        l2.text = labelStrings[2]
        l2.textColor = UIColor.whiteColor()
        self.view.addSubview(l2)
        layers.append(l2.convertToLayer())
        
        hexStrings = Data.hexStrings[index]
        
        let lbls = HexManager.hexLabels(hexpts, hexStrings: hexStrings)
        for l in lbls {
            self.view.addSubview(l)
            layers.append(l.convertToLayer())
        }
        
    }
    
    // 3D touch
    
    
    
}
