//
//  ViewController.swift
//  SCWWDC
//
//  Created by Sebastian Cain on 4/9/16.
//  Copyright © 2016 Sebastian Cain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var sh = CGFloat()
    var sw = CGFloat()
    
    var sv = UIScrollView()
    var tvc = TitleViewController()
    
    var bv1 = UIView()
    var bv2 = UIView()
    var bv3 = UIView()
    var bv4 = UIView()
    var bv5 = UIView()
    
    var bvs = Array<UIView>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sh = self.view.frame.height
        sw = self.view.frame.width
        
        self.view.backgroundColor = UIColor.clearColor()
        
        bvs = [bv1, bv2, bv3, bv4, bv5]
        for i in 0...4 { bvs[i].frame = CGRect(x: 0, y: 0, width: sw, height: sh); bvs[i].alpha = 0; self.view.addSubview(bvs[i]) }
        
        bv1.backgroundColor = UIColor(hexString: "16a085")
        bv2.backgroundColor = UIColor(hexString: "27ae60")
        bv3.backgroundColor = UIColor(hexString: "2980b9")
        bv4.backgroundColor = UIColor(hexString: "c0392b")
        bv5.backgroundColor = UIColor(hexString: "8e44ad")
        
        let sv = UIScrollView(frame: self.view.frame)
        sv.contentSize = CGSize(width: sw, height: sh*6)
        sv.pagingEnabled = true
        sv.delegate = self
        self.view.addSubview(sv)
        
        //tvc.sv = sv
        let tvv = tvc.view
        tvv.backgroundColor = UIColor.clearColor()
        tvv.frame = CGRect(x: 0, y: 0, width: sw, height: sh)
        sv.addSubview(tvv)
        
    }
    
    // MARK: lmao

//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        let co = scrollView.contentOffset.y;
//        if co <= sh {
//            tvc.face.alpha = (sh-co)/sh
//            bvs[0].alpha = (co)/sh
//        }
//        for i in 0...3 {
//            if co <= sh*CGFloat(i+2) {
//                bvs[i].alpha = (CGFloat(i+2)*sh-co)/sh
//                bvs[i+1].alpha = (co-(sh*CGFloat(i+1)))/sh
//                break
//            }
//        }
//    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let co = scrollView.contentOffset.y;
        if co % sh == 0 {
            pageReached(Int(co/sh))
        }
        for i in 0...3 {
            if co <= sh*CGFloat(i+2) {
                bvs[i].alpha = (CGFloat(i+2)*sh-co)/sh
                bvs[i+1].alpha = (co-(sh*CGFloat(i+1)))/sh
                break
            }
        }
    }
    
    func pageReached(page: Int) {
        
    }
    
    func scrollTapped() {
        sv.setContentOffset(CGPoint(x: 0, y: sh), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

