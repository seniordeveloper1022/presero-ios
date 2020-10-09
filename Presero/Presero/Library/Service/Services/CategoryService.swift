//
//  CategoryService.swift
//  TawridSupplier
//
//  Created by Gulfam Khan on 26/02/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class CategoryService:BaseService {
    
    private override init(){}
    
    static func shared() -> CategoryService{
        return CategoryService()
    }
    
    //MARK:- AllCategory Service API
    func getAllCategories(completion: @escaping (_ message: String, _ success: Bool, _ list: CategoryListViewModel?, _ responseType:ServiceResponseType)->Void){
        
        let completeURL = EndPoints.BASE_URL + EndPoints.getAllCategories
        self.makePostAPICall(with: completeURL, params: nil, headers:self.getHeaders()) { (message, success, json, responseType) in
            if success {
                let list = CategoryListViewModel(list: json![KEY_RESPONSE_DATA])
                completion(message,success,list, responseType)
            }else {
                completion(message,success,nil, responseType)
            }
        }
    }
    
    //MARK:- Request New Category API
    func requestCategory(_ params:ParamsAny, completion: @escaping (_ message:String, _ success:Bool, _ responseType:ServiceResponseType)->Void) {
        
        let completeURL = EndPoints.BASE_URL + EndPoints.requestNewCategory
        self.makePostAPICall(with: completeURL, params: params, headers: self.getHeaders()) { (message, success, json, responseType) in
            completion(message,success,responseType)
        }
    }
    
}
