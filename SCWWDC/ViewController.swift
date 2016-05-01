//
//  ViewController.swift
//  SCWWDC
//
//  Created by Sebastian Cain on 4/9/16.
//  Copyright © 2016 Sebastian Cain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UIViewControllerPreviewingDelegate {
    
    var sh = CGFloat()
    var sw = CGFloat()
    
    var sv = UIScrollView()
    
    var tvc = TitleViewController()
    var fvc = FinalViewController()
    
    var vcview = UIView()
    var vcs = [ComponentViewController]()
    
    var hex = [CAShapeLayer]()
    
    var gvc = GameViewController()
    
    var bv1 = UIColor()
    var bv2 = UIColor()
    var bv3 = UIColor()
    var bv4 = UIColor()
    var bv5 = UIColor()
    
    var bvs = [UIColor]()
    
    var co = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sh = self.view.frame.height
        sw = self.view.frame.width
        
        self.navigationController?.navigationBarHidden = true
        self.view.backgroundColor = UIColor(hexString: "16a085")
        
        let gv = gvc.view
        gv.frame = self.view.frame
        self.view.addSubview(gv)
        
        let overlay = UIView(frame: self.view.frame)
        overlay.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
        self.view.addSubview(overlay)
        
        bv2 = UIColor(hexString: "16a085")
        bv3 = UIColor(hexString: "2980b9")
        bv4 = UIColor(hexString: "8e44ad")
        bv5 = UIColor(hexString: "c0392b")
        
        bvs = [bv2, bv3, bv4, bv5]
        
        let hexps = HexManager.hexPoints(96, sw: sw, sh: sh)
        let hexview = UIView(frame: self.view.frame)
        for i in 0..<6 {
            let h = HexManager.hexLayer(hexps[i])
            h.setValue(i, forKey: "index")
            hex.append(h)
            hexview.layer.addSublayer(h)
        }
        self.view.addSubview(hexview)
        
        vcview.frame = self.view.frame
        vcview.userInteractionEnabled = false
        for i in 0..<4 {
            let newvc = ComponentViewController()
            newvc.setup(i)
            for j in newvc.layers { j.strokeStart = 1; j.strokeEnd = 1 }
            newvc.view.userInteractionEnabled = false
            vcs.append(newvc)
            
            let v = newvc.view
            v.frame = CGRect(x: 0, y: 0, width: sw, height: sh)
            vcview.addSubview(v)
        }
        self.view.addSubview(vcview)
        
        sv = UIScrollView(frame: self.view.frame)
        sv.contentSize = CGSize(width: sw*6, height: sh)
        sv.pagingEnabled = true
        sv.delegate = self
        sv.decelerationRate = UIScrollViewDecelerationRateFast
        sv.bounces = false
        self.view.addSubview(sv)
        
        let tv = tvc.view
        tv.frame = CGRect(x: 0, y: 0, width: sw, height: sh)
        sv.addSubview(tv)
        let fv = fvc.view
        fv.frame = CGRect(x: sw*5, y: 0, width: sw, height: sh)
        sv.addSubview(fv)
        
        if(traitCollection.forceTouchCapability == .Available) {
            registerForPreviewingWithDelegate(self, sourceView: view)
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        co = scrollView.contentOffset.x;
        
//        print("content offset \(co)")
        
        animatePage(Int(co/sw), offset: co%sw)
        
        for i in 0...3 {
            if co < sw {
                self.view.backgroundColor = UIColor(hexString: "16a085")
                break
            } else if co >= sw*4 {
                self.view.backgroundColor = UIColor(hexString: "c0392b")
                break
            } else if co < sw*CGFloat(i+2) {
                self.view.backgroundColor = UIColor(red: iv(bvs[i].red, c2: bvs[i+1].red, offset: co), green: iv(bvs[i].green, c2: bvs[i+1].green, offset: co), blue: iv(bvs[i].blue, c2: bvs[i+1].blue, offset: co), alpha: CGFloat(1))
                break
            }
        }
    }
    
    func iv(c1: CGFloat, c2: CGFloat, offset: CGFloat) -> CGFloat {
        return c1+((c2-c1)*((offset%sw)/sw))
    }
    
    func animatePage(page: Int, offset: CGFloat) {
        if page == 5 { return }
        if page != 0 {
            for i in vcs[page-1].layers {
                if offset == 0.0 { i.strokeStart = 0.0 }
                let diff = (offset%sw)/sw
                if diff < 0.4 { i.strokeEnd = (0.4-diff)/0.4 }
                else { i.strokeEnd = 0.0 }
            }
        }
        if page != 4 {
            for i in vcs[page].layers {
                let diff = (offset%sw)/sw
                if diff > 0.6 { i.strokeStart = (1.0-diff)/0.4 }
                else { i.strokeStart = 1.0 }
                
            }
        }
        
    }
    
    func scrollTapped() {
        sv.setContentOffset(CGPoint(x: 0, y: sh), animated: true)
    }

    func currentPage() -> Int {
        return Int(co/sw)
    }
    // MARK: 3D touch
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if( segue.identifier == "detail" ){
            
            let vc = segue.destinationViewController as! DetailViewController
            vc.section = 0
            vc.index = 0
            
        }
        
    }
    
    // MARK: Trait collection delegate methods
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        
    }
    
    // MARK: UIViewControllerPreviewingDelegate methods
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if currentPage() == 0 || currentPage() == 5 { return nil }
        
        var selectedlayer = CAShapeLayer()
        var hit = false
        for i in hex {
            if (i.hitTest(location) != nil) {
                selectedlayer = i
                hit = true
                break
            }
        }
        if hit == false { return nil }
        
        print(selectedlayer.debugDescription)
        
        guard let detailVC = storyboard?.instantiateViewControllerWithIdentifier("dvc") as? DetailViewController else { return nil }
        
        detailVC.preferredContentSize = CGSize(width: 0.0, height: 190)
        detailVC.index = selectedlayer.valueForKey("index") as! Int
        detailVC.section = currentPage() - 1
        previewingContext.sourceRect = selectedlayer.frame
        
        return detailVC
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        showViewController(viewControllerToCommit, sender: self)
        
    }
    
    // MARK: REMOVE BEFORE SUBMISSION
//    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        let touch = touches.first
//        let location = touch!.locationInView(self.view)
//        print(location)
//        if currentPage() == 0 || currentPage() == 5 { return }
//        
//        var selectedlayer = CAShapeLayer()
//        var hit = false
//        for i in hex {
//            if (i.hitTest(location) != nil) {
//                selectedlayer = i
//                hit = true
//                break
//            }
//        }
//        if hit == false { return }
//        
//        print(selectedlayer.debugDescription)
//        
//        guard let detailVC = storyboard?.instantiateViewControllerWithIdentifier("dvc") as? DetailViewController else { return }
//        
//        detailVC.preferredContentSize = CGSize(width: 0.0, height: 190)
//        detailVC.index = selectedlayer.valueForKey("index") as! Int
//        detailVC.section = currentPage() - 1
//        self.navigationController?.pushViewController(detailVC, animated: true)
//    }
}

