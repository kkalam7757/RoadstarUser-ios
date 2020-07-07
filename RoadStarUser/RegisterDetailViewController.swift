//
//  RegisterDetailViewController.swift
//  RoadStarUser
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class RegisterDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func btnback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnNext(_ sender: Any) {
        self.goToDashboardScreen()
    }
    
    @IBAction func btnSignIn(_ sender: Any) {
        self.goToSignInScreen()
    }
    
    
    func goToSignInScreen(){
        let controller = UIStoryboard.loadSignInViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    func goToDashboardScreen(){
        let controller = self.storyboard?.instantiateViewController(withIdentifier:"SWRevealViewController") as! SWRevealViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
