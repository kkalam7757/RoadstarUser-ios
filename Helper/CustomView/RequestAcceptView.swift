//
//  RequestAcceptView.swift
//  RoadStarUser
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class RequestAcceptView: UIView {

    @IBOutlet weak var btnOk: UIButton!
    
    @IBAction func btnOk(_ sender: Any) {
        singleton().HBRectView.removeSubviewFromParentWidnow()
    }
}
