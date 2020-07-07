//
//  UIColor+Theme.swift
//  DashSpotlessUser
//
//  Created by admin on 13/02/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit


extension UIColor{
    
    fileprivate static func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    fileprivate static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return rgba(r, g, b, 1.0)
    }
    
    static let App_BlueColor = rgb(21, 151, 203)
    static let App_Dark_BlueColor = rgb(0, 112, 147)
    static let App_TransparentBlackColor = rgba(0, 0, 0, 0.5)
    static let App_ExtraLightGrayColor = rgb(218,222,229)
    static let App_LightGrayColor = rgb(218,222,239)
 
}
