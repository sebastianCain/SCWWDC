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
    var avc = AboutViewController()
    var hvc = HackathonsViewController()
    var svc = SkillsViewController()
    var evc = ExperienceViewController()
    var fvc = FinalViewController()
    
    var vcs = [ComponentViewController]()
    
    var gvc = GameViewController()
    
    var bv1 = UIColor()
    var bv2 = UIColor()
    var bv3 = UIColor()
    var bv4 = UIColor()
    var bv5 = UIColor()
    
    var bvs = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sh = self.view.frame.height
        sw = self.view.frame.width
        
        self.view.backgroundColor = UIColor(hexString: "27ae60")
        
        let gv = gvc.view
        gv.frame = self.view.frame
        self.view.addSubview(gv)
        
        let overlay = UIView(frame: self.view.frame)
        overlay.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
        self.view.addSubview(overlay)
        
        bv1 = UIColor(hexString: "27ae60")
        bv2 = UIColor(hexString: "16a085")
        bv3 = UIColor(hexString: "2980b9")
        bv4 = UIColor(hexString: "8e44ad")
        bv5 = UIColor(hexString: "c0392b")
        
        bvs = [bv1, bv2, bv3, bv4, bv5]
        
        vcs = [avc, hvc, svc, evc, fvc]
        
        let sv = UIScrollView(frame: self.view.frame)
        sv.contentSize = CGSize(width: sw, height: sh*6)
        sv.pagingEnabled = true
        sv.delegate = self
        self.view.addSubview(sv)
        
        let tv = tvc.view
        tv.frame = CGRect(x: 0, y: 0, width: sw, height: sh)
        sv.addSubview(tv)
        
        for i in 0..<vcs.count {
            let v = vcs[i].view
            v.frame = CGRect(x: 0, y: sh*CGFloat(i+1), width: sw, height: sh*CGFloat(i+1))
            sv.addSubview(v)
        }
        
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
        
        animatePage(Int(co/sh), offset: co%sh)
        
        for i in 0...3 {
            if co < sh {
                self.view.backgroundColor = UIColor(hexString: "27ae60")
            } else if co < sh*CGFloat(i+2) {
                self.view.backgroundColor = UIColor(red: iv(bvs[i].red, c2: bvs[i+1].red, offset: co), green: iv(bvs[i].green, c2: bvs[i+1].green, offset: co), blue: iv(bvs[i].blue, c2: bvs[i+1].blue, offset: co), alpha: CGFloat(1))
                break
            }
        }
    }
    
    func iv(c1: CGFloat, c2: CGFloat, offset: CGFloat) -> CGFloat {
        return c1+((c2-c1)*((offset%sh)/sh))
    }
    
    func animatePage(page: Int, offset: CGFloat) {
        //print("p: \(page) o: \(offset) ")
        if page == 5 { return }
        for i in vcs[page].layers {
            //print(((offset%sh)/sh-i.s)/(i.e-i.s))
            let diff = (offset%sh)/sh
            if diff < i.s { i.layer.strokeEnd = 0.0 }
            else if diff >= i.s && diff < i.e { i.layer.strokeEnd = (diff-i.s)/(i.e-i.s) }
            else if diff > i.e { i.layer.strokeEnd = 1.0 }
        }
    }
    
    func scrollTapped() {
        sv.setContentOffset(CGPoint(x: 0, y: sh), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

