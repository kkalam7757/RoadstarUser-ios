//
//  UIFont+size.swift
//  DashSpotlessUser
//
//  Created by admin on 13/02/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

extension UIFont{

    fileprivate static func fontSize(_ size:CGFloat, weight:UIFont.Weight)->UIFont{
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
    static let systemRegularSize13 = fontSize(13, weight: UIFont.Weight.regular)
    static let systemRegularSize15 = fontSize(15, weight: UIFont.Weight.regular)
    static let systemRegularSize17 = fontSize(17, weight: UIFont.Weight.regular)
    static let SystemBoldSize15 = fontSize(15, weight: UIFont.Weight.bold)
    static let SystemHeavySize15 = fontSize(15, weight: UIFont.Weight.heavy)
    static let SystemBoldSize16 = fontSize(16, weight: UIFont.Weight.bold)
    static let SystemSemiBoldSize16 = fontSize(16, weight: UIFont.Weight.semibold)
    static let SystemRegularSize20 = fontSize(20, weight: UIFont.Weight.regular)
    static let SystemMediumSize20 = fontSize(20, weight: UIFont.Weight.medium)
}
