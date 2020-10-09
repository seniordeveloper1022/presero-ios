//
//  OrderService.swift
//  TawridSupplier
//
//  Created by Gulfam Khan on 09/03/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class OrderService:BaseService {
    
    private override init(){}
    
    static func shared() -> OrderService{
        return OrderService()
    }
    
    //MARK:- Get Orders List
    func getAllOrders(params:ParamsAny, completion: @escaping (_ message: String, _ success: Bool, _ list: OrderListViewModel?, _ response:ServiceResponseType)->Void){
        
        let completeURL = EndPoints.BASE_URL + EndPoints.getOrderList
        self.makePostAPICall(with: completeURL, params: params, headers:self.getHeaders()) { (message, success, json, responseType) in
            if success {
                let list = OrderListViewModel(json![KEY_RESPONSE_DATA])
                completion(message,success,list, responseType)
            }else {
                completion(message,success,nil,responseType)
            }
        }
    }
    
    //MARK:- Get Orders List
    func getOrderDetails(params:ParamsAny, completion: @escaping (_ message: String, _ success: Bool, _ list: OrderProductsListViewModel?, _ response:ServiceResponseType)->Void){
        
        let completeURL = EndPoints.BASE_URL + EndPoints.orderDetails
        self.makePostAPICall(with: completeURL, params: params, headers:self.getHeaders()) { (message, success, json, responseType) in
            if success {
                let list = OrderProductsListViewModel(json![KEY_RESPONSE_DATA])
                completion(message,success,list,responseType)
            }else {
                completion(message,success,nil, responseType)
            }
        }
    }
    
    //MARK:- Accept Order
    func acceptOrder(params:ParamsAny, completion: @escaping (_ message: String, _ success: Bool, _ response: ServiceResponseType)->Void){
        
        let completeURL = EndPoints.BASE_URL + EndPoints.orderAccept
        self.makePostAPICall(with: completeURL, params: params, headers:self.getHeaders()) { (message, success, json, responseType) in
            completion(message,success,responseType)
        }
    }
    
    //MARK:- Cancel Order
    func cancelOrder(params:ParamsAny, completion: @escaping (_ message: String, _ success: Bool, _ response: ServiceResponseType)->Void){
        
        let completeURL = EndPoints.BASE_URL + EndPoints.orderCancel
        self.makePostAPICall(with: completeURL, params: params, headers:self.getHeaders()) { (message, success, json, responseType) in
            completion(message,success,responseType)
        }
    }
    
    //MARK:- Cancel Order
    func completeOrder(params:ParamsAny, completion: @escaping (_ message: String, _ success: Bool, _ response: ServiceResponseType)->Void){
        
        let completeURL = EndPoints.BASE_URL + EndPoints.completeOrder
        self.makePostAPICall(with: completeURL, params: params, headers:self.getHeaders()) { (message, success, json, responseType) in
            completion(message,success,responseType)
        }
    }
    
    //MARK:- Get Order Jobs
    func getJobOrders(params:ParamsAny, completion: @escaping (_ message: String, _ success: Bool, _ response: ServiceResponseType, _ list:OrderListViewModel?)->Void){
        
        let completeURL = EndPoints.BASE_URL + EndPoints.jobOrders
        self.makePostAPICall(with: completeURL, params: params, headers:self.getHeaders()) { (message, success, json, responseType) in
            if success {
                let list = OrderListViewModel(json![KEY_RESPONSE_DATA])
                completion(message,success,responseType, list)
            }else {
                completion(message,success,responseType, nil)
            }
        }
    }
    
}
