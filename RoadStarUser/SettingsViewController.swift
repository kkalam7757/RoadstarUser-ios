//
//  SettingsViewController.swift
//  RoadStarUser
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnback(_ sender: Any) {
              self.navigationController?.popViewController(animated: true)
          }
    
    @IBAction func btnchnagePassword(_ sender: Any) {
        self.goToChangPasswordScreen()
    }
    
    func goToChangPasswordScreen(){
        let controller = UIStoryboard.loadChangePasswordViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
