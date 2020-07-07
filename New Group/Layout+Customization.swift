//
//  Layout+Customization.swift
//  DashSpotlessUser
//
//  Created by admin on 12/02/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
  
    func customizeView(radius:CGFloat,borderColor:UIColor,borderWidth:CGFloat,backgroundColor:UIColor){
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.masksToBounds = true
        layer.borderColor = borderColor.cgColor
        self.backgroundColor = backgroundColor
    }
    
    func cornerRadius(radius:CGFloat){
       layer.cornerRadius = radius
       layer.masksToBounds = true
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

//    func roundCorners(_ corners:UIRectCorner, radius: CGFloat){
//        let rectShape = CAShapeLayer()
//        rectShape.bounds = self.frame
//        rectShape.position = self.center
//        rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
//        //self.layer.backgroundColor = UIColor.green.cgColor
//        self.layer.mask = rectShape
//    }
   
    func addBorder(toEdges edges: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        func addBorder(toEdge edges: UIRectEdge, color: UIColor, thickness: CGFloat) {
            let border = CALayer()
            border.backgroundColor = color.cgColor
            
            switch edges {
            case .top:
                border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
            case .bottom:
                border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
            case .left:
                border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
            case .right:
                border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
            default:
                break
            }
            layer.addSublayer(border)
        }
        if edges.contains(.top) || edges.contains(.all) {
            addBorder(toEdge: .top, color: color, thickness: thickness)
        }
        if edges.contains(.bottom) || edges.contains(.all) {
            addBorder(toEdge: .bottom, color: color, thickness: thickness)
        }
        if edges.contains(.left) || edges.contains(.all) {
            addBorder(toEdge: .left, color: color, thickness: thickness)
        }
        if edges.contains(.right) || edges.contains(.all) {
            addBorder(toEdge: .right, color: color, thickness: thickness)
        }
    }
}

extension UITextField{
    func customize(placeHolder:String,placeHolderColor:UIColor,cornerRadius:CGFloat,borderWidth:CGFloat,borderColor:UIColor,backgroundColor:UIColor){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.backgroundColor = backgroundColor
        self.attributedPlaceholder = NSAttributedString(string:placeHolder,
                                    attributes: [NSAttributedString.Key.foregroundColor:placeHolderColor])
     }
    
    func padding(withPlaceHolder placeHolder:String,padding:CGFloat,placeHolderColor:UIColor){
       let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
        self.attributedPlaceholder = NSAttributedString(string:placeHolder,
                                                        attributes: [NSAttributedString.Key.foregroundColor:placeHolderColor])
    }
    
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

extension UIImage {
     func circle(diameter: CGFloat, color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: diameter, height: diameter), false, 0)
        let ctx = UIGraphicsGetCurrentContext()!
        ctx.saveGState()
        let rect = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        ctx.setFillColor(color.cgColor)
        ctx.fillEllipse(in: rect)
        ctx.restoreGState()
        let img = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return img
    }
  
}

extension UITableView {
    /**
     Calculates the total height of the tableView that is required if you ware to display all the sections, rows, footers, headers...
     */
    func contentHeight() -> CGFloat {
        var height = CGFloat(0)
        for sectionIndex in 0..<numberOfSections {
            height += rect(forSection: sectionIndex).size.height
        }
        return height
    }
    
}


