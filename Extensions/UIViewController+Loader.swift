//
//  SignInViewController.swift
//  PowerPointz
//
//  Created by admin on 24/09/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

extension UIViewController:NVActivityIndicatorViewable{
    
    func showLoader(){
        let size = CGSize(width: 60, height:60)
        startAnimating(size,type: .ballPulse,color:UIColor.white, backgroundColor: UIColor.black.withAlphaComponent(0.7))
    }
    
    func hideLoader(){
        self.stopAnimating()
    }
}
