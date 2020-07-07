//
//  CameraView.swift
//  Courier
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class CameraView: UIView {

    @IBOutlet weak var containerView: UIView!
    
  override func awakeFromNib() {
         super.awakeFromNib()
         //self.containerView.cornerRadius(radius: 10)
     }
     
    
    @IBAction func onTapCross(_ sender: Any) {
        singleton().HBRectView.removeSubviewFromParentWidnow()
    }
    
}
