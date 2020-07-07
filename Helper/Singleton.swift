//
//  Singleton.swift
//  DashSpotlessUser
//
//  Created by admin on 20/02/20.
//  Copyright © 2020 admin. All rights reserved.
//com.DashSpotlessUser

import UIKit
import Foundation
import SystemConfiguration

class Singleton: NSObject {
    static let sharedInstance = Singleton()
    
    var RegisterMobileNumber =  String()
    var UserId = String()
    var Token = String()
    
    var HBRectView: HBView!
    var Session:HBURLRequestSession!
    var CurrentAddress = String()
    var bottomAlertHeight:CGFloat?
    var some = Bool()
    override init() {
        super.init()
        HBRectView = HBView()
        Session = HBURLRequestSession()
    }
    
    func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        return ret
    }
    
    func getCurrentTimeStamp() -> Int64! {
        let date = Date()
        return Int64(date.timeIntervalSince1970 * 1000)
    }
 
    
    func imageIsNullOrNot(imageName : UIImage)-> Bool{
        let size = CGSize(width: 0, height: 0)
        if (imageName.size.width == size.width){
            return false
        }
        else{
            return true
        }
    }
    
    func calculateTextheight(withConstrainedWidth width: CGFloat, font: UIFont, text:String) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    func saveToUserDefaults(withKeyValue value:Any,key:String){
        UserDefaults.standard.set(value,forKey: key)
    }
    
    func getFromUserDefaults(withKey key:String)->Any?{
        return UserDefaults.standard.object(forKey: key)
    }
}

func singleton() -> Singleton {
    return Singleton.sharedInstance
}
