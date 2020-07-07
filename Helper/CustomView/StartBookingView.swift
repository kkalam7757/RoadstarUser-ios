//
//  StartBookingView.swift
//  Courier
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol BookingViewDelegate {
    func onTapVehicle()
}

  class StartBookingView: UIView {
   var delegate: BookingViewDelegate?
   
    override func awakeFromNib() {
           super.awakeFromNib()
       }
    
    @IBAction func onTapVehicle(_ sender: Any) {
        self.delegate?.onTapVehicle()
    }
    
}
