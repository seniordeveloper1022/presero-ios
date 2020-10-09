//
//  API.swift
//  Zon Bau
//
//  Created by Gulfam Khan on 04/09/2019.
//  Copyright © 2019 AcclivousByte. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LoginService: BaseService {
    
    //MARK:- Shared Instance
    private override init() {}
    static func shared() -> LoginService {
        return LoginService()
    }
    
    fileprivate func saveUserInfo(_ userInfo:UserViewModel) {
        Global.shared.user = userInfo
        UserDefaultsManager.shared.isUserLoggedIn = true
        UserDefaultsManager.shared.userInfo = userInfo
    }
    
    //MARK:- Verify Url API
    func verifyUrl(params:Parameters?,completion: @escaping (_ error: String, _ success: Bool)->Void) {
        
        let completeURL = EndPoints.BASE_URL
        self.makePostAPICall(with: completeURL, params: params) { (message, success, json, responseType) in
            if success {
                let data = json![KEY_RESPONSE_DATA]
                Global.shared.url = data["url"].stringValue
                UserDefaultsManager.shared.configurationUrl = data["url"].stringValue
            }
            completion(message,success)
        }
    }
    
    //MARK:- Register User API.
    func getUserRegister(params:ParamsAny, completion: @escaping (_ error: String, _ success: Bool)->Void){
        
        let completeURL = EndPoints.BASE_URL + EndPoints.Register
        self.makePostAPICall(with: completeURL, params: params) { (message, success, json, _) in
            completion(message,success)
        }
    }
    
 
    
//    //MARK:- Register User API.
//    func updateUserProfile(params:ParamsString, profileImage:UIImage?, completion: @escaping (_ error: String, _ success: Bool)->Void){
//
//        let completeURL = EndPoints.BASE_URL + EndPoints.updateProfile
//        var imageDict = [String:Data]()
//        if let image = profileImage {
//            imageDict[DictKeys.image] = image.jpegData(compressionQuality: 0.8)!
//        }
//        self.makePostAPICallWithMultipart(with: completeURL, dict: imageDict, params: params, headers: self.getHeaders()) { (message, success, json, responseType) in
//            if success {
//                let userInfo = UserViewModel(json![KEY_RESPONSE_DATA])
//                self.saveUserInfo(userInfo)
//            }
//            completion(message,success)
//        }
//    }
    
    //MARK:- Forget password API
    func forgetPassword(params:Parameters?,completion: @escaping (_ error: String, _ success: Bool)->Void){
        
        let completeURL = EndPoints.BASE_URL + EndPoints.forgotPassword
        self.makePostAPICall(with: completeURL, params: params) { (message, success, json, responseType) in
            completion(message,success)
        }
    }
    
    //MARK:- Change Password API
    func changePassword(params:ParamsAny?, completion: @escaping (_ message:String, _ success:Bool, _ response:ServiceResponseType)->Void) {
        let completeUrl = EndPoints.BASE_URL + EndPoints.changePassword
        self.makePostAPICall(with: completeUrl, params: params, headers: self.getHeaders()) { (message, success, json, responseType) in
            completion(message,success, responseType)
        }
    }
    
    //MARK:- Update Password API
    func updatePassword(params:ParamsAny?, completion: @escaping (_ message:String, _ success:Bool)->Void) {
        let completeUrl = EndPoints.BASE_URL + EndPoints.updatePassword
        self.makePostAPICall(with: completeUrl, params: params) { (message, success, json, responseType) in
            completion(message,success)
        }
    }
    
//    //MARK:- Logout user API
//    func getUserLogout(params:Parameters?,completion: @escaping (_ message: String, _ success: Bool)->Void){
//        
//        let completeURL = EndPoints.BASE_URL + EndPoints.logout
//        let header:HTTPHeaders = [DictKeys.authoraization:Global.shared.user?.token ?? kBlankString]
//        self.makePostAPICall(with: completeURL, params: params, headers: header) { (message, success, json, responseType) in
//            completion(message,success)
//        }
//    }
    //MARK:- get token API
    func getToken(params:Parameters?,completion: @escaping (_ message: String, _ success: Bool , _ token : String)->Void){
          let completeURL = EndPoints.BASE_URL
        //  let header:HTTPHeaders = [DictKeys.authoraization:Global.shared.user?.token ?? kBlankString]
          self.makePostAPICall(with: completeURL, params: params) { (message, success, json, responseType) in
            if(success){
                let token = json!["result"]["authorizationToken"].stringValue
              completion(message,success,token)
            }
            else{
               completion(message,success,"")
            }
          }
      }
    //MARK:- get operatorList API
       func getOperators(params:Parameters?,completion: @escaping (_ message: String, _ success: Bool , _ operatorList : OperatorListViewModel?)->Void){
             let completeURL = EndPoints.BASE_URL
           //  let header:HTTPHeaders = [DictKeys.authoraization:Global.shared.user?.token ?? kBlankString]
             self.makePostAPICall(with: completeURL, params: params) { (message, success, json, responseType) in
                if let data = json{
                let operatorList = OperatorListViewModel(list: data["result"])
                 completion(message,success,operatorList)
                }
                else{
                 completion(message,success,nil)
                }
             }
         }
    
    func getEncrptedPassword(params:Parameters?,completion: @escaping (_ message: String, _ success: Bool , _ password : String)->Void){
               let completeURL = EndPoints.BASE_URL
             //  let header:HTTPHeaders = [DictKeys.authoraization:Global.shared.user?.token ?? kBlankString]
               self.makePostAPICall(with: completeURL, params: params) { (message, success, json, responseType) in
                if let data = json{
                let password = data["result"].stringValue
                   completion(message,success,password)
               }
                else{
                      completion(message,success,"")
                }
               }
           }
    
}
