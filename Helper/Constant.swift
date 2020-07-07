//
//  RegisterViewController.swift
//  TeriMeriJodi
//
//  Created by admin on 18/10/19.
//  Copyright © 2019 admin. All rights reserved.
//
import Foundation


struct BASEURL {
    static let url =  "http://alobhatech.com/dashspotless/public/"
}
struct ENDPOINT {
    static let Register = "api/user/register"
}

struct PARAM_KEY{
    
    static let MobileNumber = "mobile_number"
    static let Otp = "otp"
    static let Name = "name"
    static let Email = "email"
    static let DeviceType = "device_type"
    static let UserId = "user_id"
    
}

struct AppMessage {
    
    static let MOBILE_NUMBER = "Please Enter Your Moblie Number"
    static let ValidMobileNumber = "Enter Valid Mobile Number"
    static let PASSWORD = "Please Enter Your Password"
    static let Enter_OTP = "Enter Your OTP"
    static let FULLNAME = "Please Enter Your Full Name"
    static let LAST_NAME = "Please Enter Your Last Name"
    static let EMAIL = "Enter Your Email"
    static let ValidEmailMsg = "Please enter valid email address"
    static let CONFIRM_PASSWORD = "Please Enter Your Confirm Password"
    static let ConnectionErrorMsg = "Check internet connection !"
    static let ServerErrorMsg = "Server encountered error"
    static let NoDataMsg = "No Related News Found"
    static let FailureMsg = "Failure error"
    static let validmobile = "Please enter valid mobile number"
    
}
