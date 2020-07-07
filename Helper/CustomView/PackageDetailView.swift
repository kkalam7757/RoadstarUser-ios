//
//  PackageDetailView.swift
//  Courier
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol PackageDetailViewDelegate {
    func onTapPackageDetailNextButton()
    func onTapCamera()
}

class PackageDetailView: UIView {
    
    var delegate: PackageDetailViewDelegate?
    @IBOutlet weak var textFieldCategory: UITextField!
    @IBOutlet weak var textFieldProduct: UITextField!
    @IBOutlet weak var textFieldProductWeight: UITextField!
    
    override func awakeFromNib() {
           super.awakeFromNib()
       }
       
    
    @IBAction func onTapNext(_ sender: Any) {
        self.delegate?.onTapPackageDetailNextButton()
    }
    
    @IBAction func onTapAttachment(_ sender: Any) {
       self.delegate?.onTapCamera()
    }
    

}
