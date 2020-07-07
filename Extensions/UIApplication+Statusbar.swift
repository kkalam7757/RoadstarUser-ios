//
//  UIApplication+Statusbar.swift
//  DashSpotlessUser
//
//  Created by admin on 13/02/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }

}
