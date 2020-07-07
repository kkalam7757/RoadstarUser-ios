//
//  ProfileViewController.swift
//  RoadStarUser
//
//  Created by admin on 23/06/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnSettting(_ sender: Any) {
        self.goToSettingScreen()
    }
    
    func goToSettingScreen(){
        let controller = UIStoryboard.loadSettingsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
       }
}
