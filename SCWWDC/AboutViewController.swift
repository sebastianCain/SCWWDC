//
//  AboutViewController.swift
//  SCWWDC
//
//  Created by Sebastian Cain on 4/9/16.
//  Copyright © 2016 Sebastian Cain. All rights reserved.
//

import UIKit

class AboutViewController: ComponentViewController {

    
    @IBOutlet var abtme: UILabel!
    
    @IBOutlet var labels: [UILabel]!
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        layers.append((abtme.convertToLayer(), 0.2, 0.8))
        for i in labels {
            layers.append((i.convertToLayer(), i.frame.origin.y/self.view.frame.height, 0.99))
        }
//        
//        let myPath = PocketSVG.pathFromSVGFileNamed("Apple_logo_black").takeUnretainedValue()
//        let applelayer = CAShapeLayer()
//        applelayer.path = myPath
//        self.view.layer.addSublayer(applelayer)
//        layers.append((applelayer, 0.8, 0.99))
//        
        // Do any additional setup after loading the view.For the past 3 years, I've devoted my time to designing and developing iOS apps.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
