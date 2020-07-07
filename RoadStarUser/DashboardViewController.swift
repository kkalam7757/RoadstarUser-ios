//
//  DashboardViewController.swift
//  Courier
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    
    @IBOutlet weak var buttonMenu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
          self.buttonMenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
              self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
  
    @IBAction func onTapButtons(_ sender: UIButton) {
        switch sender.tag {
               case 101:
                   self.goToMainControllerScreen()
                   break
               case 102:
                   //self.goToMainControllerScreen()
                  break
               default:
                   print("No Tag found")
               }
               
    }
    
    
    func goToMainControllerScreen(){
           let controller = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
           self.navigationController?.pushViewController(controller, animated: true)
       }
    
    
}
