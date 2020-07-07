//
//  RecieverView.swift
//  Courier
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
protocol RecieverViewDelegate {
    func onTapNext1()
}
class RecieverView: UIView {
    
        var delegate: RecieverViewDelegate?
        
        override func awakeFromNib() {
            super.awakeFromNib()
        }
        
        @IBAction func onTapNext(_ sender: Any) {
            self.delegate?.onTapNext1()
        }
        
    }
