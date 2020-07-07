//
//  PaymentMethodView.swift
//  RoadStarUser
//
//  Created by admin on 24/06/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
protocol PaymentMethodViewDelegate {
    func onTapModifyRequest()
}
class PaymentMethodView: UIView {

        var delegate: PaymentMethodViewDelegate?
        
        override func awakeFromNib() {
            super.awakeFromNib()
        }
    
    
    @IBAction func btnmodifyrequest(_ sender: Any) {
        self.delegate?.onTapModifyRequest()
    }
    
    
    
    @IBAction func btnsubmitrequest(_ sender: Any) {
        self.showsubmitrequest()
    }
    
    func showsubmitrequest(){
          let cameraView = UINib.loadRequestAcceptView(RequestAcceptView.self) as! RequestAcceptView
          //cameraView.delegate = self
          singleton().HBRectView.addSubViewToParentWindow(view: cameraView, withFrame: CGRect(x: 20, y:0,  width: UIScreen.main.bounds.width - 40 , height: cameraView.frame.height), isCenter: true)
      }
    
    @IBAction func btncancelrequest(_ sender: Any) {
        showcancelrequest()
    }
    
    func showcancelrequest(){
          let cameraView = UINib.loadCancelRequestView(CancelRequestView.self) as! CancelRequestView
          //cameraView.delegate = self
          singleton().HBRectView.addSubViewToParentWindow(view: cameraView, withFrame: CGRect(x: 20, y:0,  width: UIScreen.main.bounds.width - 40 , height: cameraView.frame.height), isCenter: true)
      }
    
    
    }
