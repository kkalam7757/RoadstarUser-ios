//
//  HBView.swift
//  DashSpotlessUser
//
//  Created by admin on 20/02/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import ViewAnimator

class HBView: UIView {
    var transParentView =  UIView()
    var customView = UIView()

    
//    func addSubViewToParentWindow(view:UIView,withFrame:CGRect,isCenter:Bool,animationDirection:Direction,animationOffest:CGFloat, isAnimation:Bool){
//        self.transParentView.removeFromSuperview()
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        let ParentView = appDelegate?.window?.frame
//        view.frame = withFrame
//        //view.backgroundColor = .green
//        self.transParentView = UIView(frame:ParentView!)
//        if isCenter{view.center =  self.transParentView.center}
//        self.customView = view
//        self.transParentView.backgroundColor = UIColor.App_TransparentBlackColor
//        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(removeSubviewFromParentWidnow))
//        tapGesture.delegate = self
//        self.transParentView.addGestureRecognizer(tapGesture)
//        self.transParentView.addSubview(self.customView)
//        appDelegate?.window?.addSubview(self.transParentView)
//        isAnimation ? self.animateView(view: view, type: animationDirection, offset: animationOffest) : nil
//    }
    
    func addSubViewToParentWindow(view:UIView,withFrame:CGRect,isCenter:Bool/*,isAnimation:Bool*/){
        let appDelegate = UIApplication.shared.delegate
        let ParentView = appDelegate?.window??.frame
        view.frame = withFrame
        //view.backgroundColor = .green
        self.transParentView = UIView(frame:ParentView!)
        if isCenter{view.center =  self.transParentView.center}
        self.customView = view
        self.transParentView.backgroundColor = UIColor.App_TransparentBlackColor
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(removeSubviewFromParentWidnow))
        tapGesture.delegate = self
        //self.transParentView.addGestureRecognizer(tapGesture)
        self.transParentView.addSubview(self.customView)
        appDelegate?.window??.addSubview(self.transParentView)
        //isAnimation ? self.animateView(view:view, type:.bottom) : nil
    }

   @objc func removeSubviewFromParentWidnow(){
        self.transParentView.removeFromSuperview()
    }

    func animateView(view:UIView,type:Direction,offset:CGFloat) {
        let animation = AnimationType.from(direction: type, offset: offset) //UIScreen.main.bounds.width
        view.animate(animations: [animation], reversed: false, initialAlpha: 0.5, finalAlpha: 1.0, delay: 0.0, duration: 0.5, options: .curveEaseInOut, completion: nil)
    }
    
    func showAlert(message:String){
        singleton().bottomAlertHeight = message.count > 50 ? 60 : 40
        let alert = JDropDownAlert(position: .bottom)
        alert.messageFont = UIFont.boldSystemFont(ofSize: 20)
        alert.height = singleton().bottomAlertHeight!
        alert.alertWith("",message: message,topLabelColor: UIColor.clear,messageLabelColor:.white,backgroundColor:UIColor(red: 21/255, green: 151/255, blue: 203/255, alpha: 1.0))
    }
    
  
}

extension HBView:UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of:self.customView))!{
            return false
        }
        return true
    }
}

