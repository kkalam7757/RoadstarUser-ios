//
//  RegisterViewController.swift
//  RoadStarUser
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var conatinerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        conatinerView.layer.shadowColor = UIColor.lightGray.cgColor
        conatinerView.layer.shadowOpacity = 1
        conatinerView.layer.shadowOffset = .zero
        conatinerView.layer.shadowRadius = 10
        
    }
    @IBAction func btnback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnNext(_ sender: Any) {
        self.goToVerifyOTPScreen()
    }
    
    func goToVerifyOTPScreen(){
        let controller = UIStoryboard.loadVerifyOtpViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
