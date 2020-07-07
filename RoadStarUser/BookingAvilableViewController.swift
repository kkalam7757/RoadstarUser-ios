//
//  BookingAvilableViewController.swift
//  RoadStarUser
//
//  Created by Apple on 05/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class BookingAvilableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


//MARK:- EXTENSION TABLE VIEW
extension BookingAvilableViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:BookingAvilableTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BookingAvilableTableViewCell", for: indexPath) as! BookingAvilableTableViewCell
        cell.minHeight = 204
        return cell
    }
    
    func calculateTextheight(withConstrainedWidth width: CGFloat, font: UIFont, text:String) -> (CGFloat,CGFloat) {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return (ceil(boundingBox.height), ceil(boundingBox.width))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
