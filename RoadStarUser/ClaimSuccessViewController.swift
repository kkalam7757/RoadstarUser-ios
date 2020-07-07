//
//  ClaimSuccessViewController.swift
//  RoadStarUser
//
//  Created by Apple on 05/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ClaimSuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnBAck(_ sender: Any) {
           self.navigationController?.popViewController(animated: true)
       }

}
