//
//  String+Constant.swift
//  LuxuryTravel
//
//  Created by AlobhaTech on 26/07/19.
//  Copyright © 2019 AlobhaTech. All rights reserved.
//

import Foundation

extension String{
 
    func isPasswordValid() -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[$@$#!%?&])(?=.*[0-9])(?=.*[a-z]).{8,}$")
        return passwordTest.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let email = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return email.evaluate(with: self)
    }
    
    func containAlbhabetAndSpecialChar() -> Bool { //".*[^A-Za-z0-9].*"
        do {
            let regex = try NSRegularExpression(pattern: ".*[^0-9].*", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, self.count)) {
                return true
            }
            
        } catch {
            debugPrint(error.localizedDescription)
            return false
        }
        
        return false
    }
    
  
}

