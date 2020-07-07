//
//  SplashViewController.swift
//  BAM
//
//  Created by admin on 11/05/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        self.goToOverViewScreen()
        }
    }

    func goToOverViewScreen(){
        let controller = UIStoryboard.loadOverViewScreenViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
