//
//  PickupLocationView.swift
//  Courier
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class PickupLocationView: UIView {

   @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customize()
    }
    
    func customize(){
        self.containerView.customizeView(radius: 5, borderColor: .lightGray, borderWidth: 0.5, backgroundColor: .white)
    }

}
