//
//  VerifyOtpViewController.swift
//  RoadStarUser
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class VerifyOtpViewController: UIViewController {

    @IBOutlet weak var viewone: UIView!
    @IBOutlet weak var viewtwo: UIView!
    @IBOutlet weak var viewthree: UIView!
    @IBOutlet weak var viewfour: UIView!
    
    @IBOutlet weak var textfieldone: UITextField!
    @IBOutlet weak var textfieldtwo: UITextField!
    @IBOutlet weak var textfieldthree: UITextField!
    @IBOutlet weak var textfieldfour: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customize()
    }

    
    func customize(){
        viewone.layer.shadowColor = UIColor.lightGray.cgColor
        viewone.layer.shadowOpacity = 1
        viewone.layer.shadowOffset = .zero
        viewone.layer.shadowRadius = 3
        
        viewtwo.layer.shadowColor = UIColor.lightGray.cgColor
        viewtwo.layer.shadowOpacity = 1
        viewtwo.layer.shadowOffset = .zero
        viewtwo.layer.shadowRadius = 3
        
        viewthree.layer.shadowColor = UIColor.lightGray.cgColor
        viewthree.layer.shadowOpacity = 1
        viewthree.layer.shadowOffset = .zero
        viewthree.layer.shadowRadius = 3
        
        viewfour.layer.shadowColor = UIColor.lightGray.cgColor
        viewfour.layer.shadowOpacity = 1
        viewfour.layer.shadowOffset = .zero
        viewfour.layer.shadowRadius = 3
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnNext(_ sender: Any) {
        self.goToRegisterDetailScreen()
    }
    
    
    
    func goToRegisterDetailScreen(){
        let controller = UIStoryboard.loadRegisterDetailViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
