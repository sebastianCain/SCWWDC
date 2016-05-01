//
//  SkillsViewController.swift
//  SCWWDC
//
//  Created by Sebastian Cain on 4/25/16.
//  Copyright © 2016 Sebastian Cain. All rights reserved.
//

import UIKit

class SkillsViewController: ComponentViewController {

    @IBOutlet var labels: [UILabel]!
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for i in labels {
            layers.append(i.convertToLayer())
        }
        
        hexStrings = 
        let lbls = HexManager.hexLabels(hexpts, hexStrings: hexStrings)
        
        for l in lbls {
            self.view.addSubview(l)
            layers.append(l.convertToLayer())
        }
        
        // Do any additional setup after loading the view.
    }
}
