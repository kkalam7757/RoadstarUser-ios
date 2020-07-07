//
//  SelectVehicleView.swift
//  Courier
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol VehicleViewDelegate {
    func onTapNext()
}

class SelectVehicleView: UIView {

    var delegate: VehicleViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func onTapNext(_ sender: Any) {
        self.delegate?.onTapNext()
    }
    
}
