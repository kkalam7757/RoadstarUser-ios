//
//  RegisterViewController.swift
//  TeriMeriJodi
//
//  Created by admin on 18/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class HBURLRequestSession: NSObject {
    
    var header = HTTPHeaders()
    

//    // MARK: LOGIN API
//    public func postLoginRequest( params:[String: Any],finished: @escaping (Bool,NSDictionary,CustomServiceError?) -> Void) {
//        self.postRequestData(BASEURL.url + ENDPOINT.Register, method: .post, params: params) { (success, result, error) in
//            finished(success,result, error)
//        }
//    }
//    
//   
//    
//    // MARK: FETCH ALL DATES GET API
//    public func GetfetchAllDatesRequest( params:[String: Any],finished: @escaping (Bool,NSDictionary,CustomServiceError?) -> Void) {
//        self.request1(BASEURL.url + ENDPOINT.fetchAllDates, method: .get, params: params) { (success, result, error) in
//            finished(success,result, error)
//        }
//    }
//    
//    // MARK: FETCH SubmitOrder API --- RAW DATA API WITHOUT PARAMETER
//      public func postSubmitOrderRequest( params:[String: Any],finished: @escaping (Bool,NSDictionary,CustomServiceError?) -> Void) {
//        request3(BASEURL.url + ENDPOINT.SubmitOrder, method: .post, params: params) { (success, result, error) in
//                  finished(success,result, error)
//        }
//      }
//    
    
    
    
    
    private  func postRequestData(_ requestURL: URLConvertible, method: HTTPMethod, params: Parameters, _ completionBlock: ((Bool, NSDictionary, CustomServiceError?) -> Void)!) {
        print("\n")
        print("PARAMS:----->  \(params)")
        
        if !singleton().isConnectedToNetwork() {
            let customErr = CustomServiceError.init(localizedTitle: "Connection Error!", localizedDescription: AppMessage.ConnectionErrorMsg, code: 402)
            completionBlock(false, [:], customErr)
            return
        }
        
       if let dic = singleton().getFromUserDefaults(withKey: "RESPONCE") as? NSDictionary{
            let token = dic.object(forKey: "token") as! String
            let UserID = dic.object(forKey: "user_id") as! Int
            self.header = [ "Authorization" : token,
                            "id":  "\(UserID)",
                            "Accept" : "application/json",
                            "Content-Type": "application/x-www-form-urlencoded"
                    ]
        }
        
//        else if requestURL as! String == BASEURL.url + ENDPOINT.NearbyUser{
//            self.header = [ "Authorization" : singleton().getFromUserDefaults(withKey:"TOKEN") as? String ?? "",
//                            "Accept" : "application/json",
//                            "Content-Type": "application/x-www-form-urlencoded"
//            ]
//        }
        
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in params {
                print("\(key)\n\(value)")
//                if key == PARAM_KEY.MultipleImage  {
//                    let imgArr = value as! NSArray
//                    for i in 0..<imgArr.count {
//                      multipartFormData.append((imgArr[i] as! UIImage).jpegData(compressionQuality: 0.5)! , withName:"image[]", fileName: "\(singleton().getCurrentTimeStamp()!)UploadImg.jpeg", mimeType: "image/jpeg")
//                    }
//                }
                 if key == "PARAM_KEY.ProfileImage" {
                    multipartFormData.append((value as! UIImage).jpegData(compressionQuality: 0.5)! , withName: key, fileName: "\(singleton().getCurrentTimeStamp()!)UploadImg.jpeg", mimeType: "image/jpeg")
                }
                else{
                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }
        },
                         to:requestURL , headers: self.header)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                })
                
                upload.responseJSON { response in
                    print("URL:----->  \(response.request!)")
                    let JSONData = String(data: response.data!,
                                          encoding: .ascii)
                    print("JSON Response:-----> \(JSONData!)")
                    if let JSON:NSDictionary = response.result.value as? NSDictionary {
                        //print("JSON:-----> \(JSON)")
                        if let responseCode = JSON.object(forKey: "code") as? String {
                            if responseCode == "200"{
                                if completionBlock != nil {
                                    completionBlock(true, JSON,response.error as? CustomServiceError)
                                }
                            }
                            else{
                                if completionBlock != nil {
                                    let customErr = CustomServiceError.init(localizedTitle:"No Data", localizedDescription: AppMessage.NoDataMsg, code: 200)
                                    completionBlock(false, JSON,customErr)
                                }
                            }
                        }

                    }
                    else{
                        if completionBlock != nil {
                            let customErr = CustomServiceError.init(localizedTitle: "Server Problem", localizedDescription:AppMessage.ServerErrorMsg, code: 401)
                            completionBlock(false, [:],customErr)
                        }
                    }
                }
                

                
            case.failure(let encodingError):
                print(encodingError)
                if completionBlock != nil {
                    let customErr = CustomServiceError.init(localizedTitle: "Failure", localizedDescription:AppMessage.FailureMsg, code: 403)
                    completionBlock(false, [:],customErr)
                }
            }
        }
    }
    
    
    func request1(_ requestURL: URLConvertible, method: HTTPMethod, params: Parameters,finished: @escaping (Bool,NSDictionary, CustomServiceError?) -> Void){
        
        if !singleton().isConnectedToNetwork() {
            let customErr = CustomServiceError.init(localizedTitle: "Connection Error!", localizedDescription: "No Internet Connection", code: 0)
            finished(false,[:], customErr)
            return
        }
        //print("PARAMS:----->  \(params)")
        
//        self.header = [ "Authorization" : (singleton().getFromUserDefaults(withKey: "RESPONCE") as? NSDictionary)?.object(forKey: "Authorization") as? String ?? "",
//                        "id": (singleton().getFromUserDefaults(withKey: "RESPONCE") as? NSDictionary)?.object(forKey: "id") as? String ?? "",
//                        "Accept" : "application/json",
//                        "Content-Type": "application/x-www-form-urlencoded"
//        ]
        
        if let dic = singleton().getFromUserDefaults(withKey: "RESPONCE") as? NSDictionary{
            let token = dic.object(forKey: "token") as! String
            let UserID = dic.object(forKey: "user_id") as! Int
            self.header = [ "Authorization" : token,
                            "id":  "\(UserID)",
                            "Accept" : "application/json",
                            "Content-Type": "application/x-www-form-urlencoded"
                    ]
        }
        
        Alamofire.request(requestURL, method: .get, encoding: JSONEncoding.default , headers: self.header)
            .responseJSON { response in
                switch response.result{
                case .success(let json):
                    print(json)
                    print("URL:----->  \(response.request!)")
                    let JSONData = String(data: response.data!,
                                          encoding: .ascii)
                    print("JSON Response:-----> \(JSONData!)")
                    if let JsonDic:NSDictionary = response.result.value as? NSDictionary {
                        if response.response?.statusCode == 200{
                            finished(true,JsonDic,response.result.error as? CustomServiceError)
                        }
                        else{
                            let customErr = CustomServiceError.init(localizedTitle: "Error!", localizedDescription:response.result.error?.localizedDescription ?? "", code: 400)
                            finished(false,[:],customErr)
                        }
                    }

                case .failure( _):
                    let customErr = CustomServiceError.init(localizedTitle: "Error!", localizedDescription:response.result.error?.localizedDescription ?? "", code: 500)
                    finished(false,[:],customErr)
                }
        }
    }
    
  /// raw data 
    func request3(_ requestURL: URLConvertible, method: HTTPMethod, params: Parameters,finished: @escaping (Bool,NSDictionary, CustomServiceError?) -> Void){
        
        if !singleton().isConnectedToNetwork() {
            let customErr = CustomServiceError.init(localizedTitle: "Connection Error!", localizedDescription: "No Internet Connection", code: 0)
            finished(false,[:], customErr)
            return
        }
        print("\n")
        print("PARAMS:----->  \(params)")
        
        if let dic = singleton().getFromUserDefaults(withKey: "RESPONCE") as? NSDictionary{
                   let token = dic.object(forKey: "token") as! String
                   let UserID = dic.object(forKey: "user_id") as! Int
                   self.header = [ "Authorization" : token,
                                   "id":  "\(UserID)",
                                   "Accept" : "application/json",
                                   "Content-Type": "application/x-www-form-urlencoded"
                           ]
               }
        
        Alamofire.request(requestURL, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (response) in
            print("URL:----->  \(response.request!)")
            let JSONData = String(data: response.data!,
                                  encoding: .ascii)
            print("JSON Response:-----> \(JSONData!)")
            if response.result.isSuccess {
                if let JsonDic:NSDictionary = response.result.value as? NSDictionary {
                    if response.response?.statusCode == 200{
                        finished(true,JsonDic,response.result.error as? CustomServiceError)
                    }
                    else{
                        let customErr = CustomServiceError.init(localizedTitle: "Error!", localizedDescription:response.result.error!.localizedDescription, code: 400)
                        finished(false,[:],customErr)
                    }
                }
            }
            if response.result.isFailure {
                let customErr = CustomServiceError.init(localizedTitle: "Error!", localizedDescription:response.result.error!.localizedDescription, code: 500)
                finished(false,[:],customErr)
            }
        }
    }
    
}
