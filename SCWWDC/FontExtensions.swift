//
//  FontExtensions.swift
//  SCWWDC
//
//  Created by Sebastian Cain on 4/9/16.
//  Copyright © 2016 Sebastian Cain. All rights reserved.
//

import UIKit

extension UIFont {
    static func scwwdcThinFont(size: Int) -> UIFont {
        return UIFont(name: "Panton-Thin", size: CGFloat(size))!
    }
    static func scwwdcLightFont(size: Int) -> UIFont {
        return UIFont(name: "Panton-Light", size: CGFloat(size))!
    }
    static func scwwdcExtraLightFont(size: Int) -> UIFont {
        return UIFont(name: "Panton-ExtraLight", size: CGFloat(size))!
    }
    static func scwwdcSemiBoldFont(size: Int) -> UIFont {
        return UIFont(name: "Panton-SemiBold", size: CGFloat(size))!
    }
    
    static func scwwdcThinItalicFont(size: Int) -> UIFont {
        return UIFont(name: "Panton-ThinItalic", size: CGFloat(size))!
    }
    static func scwwdcLightItalicFont(size: Int) -> UIFont {
        return UIFont(name: "Panton-LightItalic", size: CGFloat(size))!
    }
    static func scwwdcExtraLightItalicFont(size: Int) -> UIFont {
        return UIFont(name: "Panton-ExtraLightItalic", size: CGFloat(size))!
    }
}
