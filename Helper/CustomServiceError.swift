//
//  RegisterViewController.swift
//  TeriMeriJodi
//
//  Created by admin on 18/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

protocol ServiceErrorProtocol: Error {
    var localizedTitle: String { get }
    var localizedDescription: String { get }
    var code: Int { get }
}

struct CustomServiceError: ServiceErrorProtocol {
    
    var localizedTitle: String
    var localizedDescription: String
    var code: Int
    
    init(localizedTitle: String?, localizedDescription: String, code: Int) {
        self.localizedTitle = localizedTitle ?? "Error"
        self.localizedDescription = localizedDescription
        self.code = code
    }
    
   /* init(withJson json : JSONData) {
        self.localizedTitle = "Error"
        if let message =  json["message"] as? String {
            self.localizedDescription = message
        } else {
            self.localizedDescription = ""
        }
        self.code = 2
    }*/
}
