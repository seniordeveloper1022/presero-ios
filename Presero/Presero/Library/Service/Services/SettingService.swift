//
//  SettingService.swift
//  TawridSupplier
//
//  Created by Gulfam Khan on 11/03/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class SettingService:BaseService {
    
    private override init(){}
    
    static func shared() -> SettingService {
        return SettingService()
    }
    
    //MARK:- Accept Order
    func changeNotificationSettings(params:ParamsAny, completion: @escaping (_ message: String, _ success: Bool, _ response: ServiceResponseType)->Void){
        
        let completeURL = EndPoints.BASE_URL + EndPoints.notificationSettings
        self.makePostAPICall(with: completeURL, params: params, headers:self.getHeaders()) { (message, success, json, responseType) in
            completion(message,success,responseType)
        }
    }
    
}
