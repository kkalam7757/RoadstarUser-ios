//
//  CancelRequestView.swift
//  RoadStarUser
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class CancelRequestView: UIView {


    @IBAction func btnYes(_ sender: Any) {
        singleton().HBRectView.removeSubviewFromParentWidnow()
    }
    
    
    @IBAction func btnNo(_ sender: Any) {
        singleton().HBRectView.removeSubviewFromParentWidnow()
    }
    
    
}
