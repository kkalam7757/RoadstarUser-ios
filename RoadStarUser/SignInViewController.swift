//
//  SignInViewController.swift
//  RoadStarUser
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        self.goToRegisterScreen()
    }
    @IBAction func btnback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnNext(_ sender: Any) {
        
    }
    
    func goToRegisterScreen(){
        let controller = UIStoryboard.loadRegisterViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func btnForgetPassword(_ sender: Any) {
        self.goToForgetPasswordScreen()
    }
    
    func goToForgetPasswordScreen(){
        let controller = UIStoryboard.loadForgetPasswordViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
