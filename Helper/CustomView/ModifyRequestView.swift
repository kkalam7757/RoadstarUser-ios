//
//  ModifyRequestView.swift
//  RoadStarUser
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
protocol ModifyRequestViewDelegate {
    func onTapyes()
}
class ModifyRequestView: UIView {

    var delegate: ModifyRequestViewDelegate?
    @IBAction func btnYes(_ sender: Any) {
        self.delegate?.onTapyes()
        singleton().HBRectView.removeSubviewFromParentWidnow()
    }
    
    
    @IBAction func btnNo(_ sender: Any) {
        singleton().HBRectView.removeSubviewFromParentWidnow()
    }
    
}
