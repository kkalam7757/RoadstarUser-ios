//
//  SideMenuViewController.swift
//  Courier
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func onTapButtons(_ sender: UIButton) {
        switch sender.tag {
             case 101:
                self.goToDashboardScreen() //done
                 
             default:
                 print("No Tag found")
             }
    }
    
     func goToDashboardScreen(){
           let controller = self.storyboard?.instantiateViewController(withIdentifier:"SWRevealViewController") as! SWRevealViewController
           self.navigationController?.pushViewController(controller, animated: true)
       }
    
    
    @IBAction func btnProfile(_ sender: Any) {
        self.goToProfileScreen()
    }
    
    
    @IBAction func btnlogout(_ sender: Any) {
        showSignoutView()
    }
    
    func showSignoutView(){
        let signoutView = UINib.loadLogoutView(LogoutView.self) as! LogoutView
        singleton().HBRectView.addSubViewToParentWindow(view: signoutView, withFrame: CGRect(x: 20, y:0,  width: UIScreen.main.bounds.width - 40 , height: signoutView.frame.height), isCenter: true)
    }
    
    func goToProfileScreen(){
        let controller = UIStoryboard.loadProfileViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
