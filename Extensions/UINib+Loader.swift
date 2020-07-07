//
//  UINib+Loader.swift
//  DashSpotlessUser
//
//  Created by admin on 20/02/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

fileprivate extension UINib {
    
    static func nib(named nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
    
    static func loadSingleView(_ nibName: String, owner: Any?) -> UIView {
        return nib(named: nibName).instantiate(withOwner: owner, options: nil)[0] as! UIView
    }
}

// MARK: App Views

extension UINib {
 
    class func loadRequestAcceptView(_ owner: AnyObject) -> UIView {
        return loadSingleView("RequestAcceptView", owner: owner)
    }
    
    class func loadModifyRequestView(_ owner: AnyObject) -> UIView {
        return loadSingleView("ModifyRequestView", owner: owner)
    }
    
    class func loadCancelRequestView(_ owner: AnyObject) -> UIView {
        return loadSingleView("CancelRequestView", owner: owner)
    }
    
    class func loadLogoutView(_ owner: AnyObject) -> UIView {
        return loadSingleView("LogoutView", owner: owner)
    }
    
    class func loadBookingView(_ owner: AnyObject) -> UIView {
           return loadSingleView("StartBookingView", owner: owner)
       }
    
       class func loadPickupLocationView(_ owner: AnyObject) -> UIView {
           return loadSingleView("PickupLocationView", owner: owner)
       }
       
       class func loadVehicleView(_ owner: AnyObject) -> UIView {
           return loadSingleView("SelectVehicleView", owner: owner)
       }
       
       class func loadPackageView(_ owner: AnyObject) -> UIView {
           return loadSingleView("PackageDetailView", owner: owner)
       }
       
       class func loadCameraView(_ owner: AnyObject) -> UIView {
              return loadSingleView("CameraView", owner: owner)
          }
       
       class func loadRecieverView(_ owner: AnyObject) -> UIView {
           return loadSingleView("RecieverView", owner: owner)
       }
    
    
    
    
       class func loadPaymentMethodView(_ owner: AnyObject) -> UIView {
              return loadSingleView("PaymentMethodView", owner: owner)
          }
    
}
