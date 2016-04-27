//
//  ComponentViewController.swift
//  SCWWDC
//
//  Created by Sebastian Cain on 4/25/16.
//  Copyright © 2016 Sebastian Cain. All rights reserved.
//

import UIKit

class ComponentViewController: UIViewController {
    
    var layers = [(layer: CAShapeLayer, s: CGFloat, e: CGFloat)]();
    
    func setStrokeEnds(end: CGFloat) {}
    
    override func viewDidLayoutSubviews() {
        self.view.backgroundColor = UIColor.clearColor()
    }
}
