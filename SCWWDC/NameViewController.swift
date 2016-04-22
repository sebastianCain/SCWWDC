//
//  NameViewController.swift
//  SCWWDC
//
//  Created by Sebastian Cain on 4/9/16.
//  Copyright © 2016 Sebastian Cain. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    
    var name = UILabel()
    var intro = UILabel()
    var fv = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clearColor()
        
        let face = UIImage(named: "headshot_large")
        fv = UIImageView(frame: self.view.frame)
        fv.image = face
        fv.contentMode = .ScaleAspectFill
        self.view.addSubview(fv)
        
        name = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        name.text = "sebastian cain"
        name.font = UIFont.scwwdcThinFont(48)
        name.textColor = UIColor.whiteColor()
        name.textAlignment = .Center
        name.alpha = 0
        self.view.addSubview(name)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * Int64(NSEC_PER_SEC)), dispatch_get_main_queue(), { Void in
            self.drawName()
        })
        
        intro = UILabel(frame: CGRect(x: 0, y: self.view.frame.height-100, width: self.view.frame.width, height: 100))
        intro.text = "WWDC SCHOLARSHIP APP\nscroll down to continue"
        intro.font = UIFont.scwwdcSemiBoldFont(18)
        intro.textColor = UIColor(white: 1, alpha: 0.5)
        intro.textAlignment = .Center
        self.view.addSubview(intro)
    }
    
    func drawName() {
        name.drawOutlineAnimatedWithLineWidth(0.7, withDuration: 3, fadeToLabel: false)
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
