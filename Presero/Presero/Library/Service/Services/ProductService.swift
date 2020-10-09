//
//  ProductService.swift
//  TawridSupplier
//
//  Created by Gulfam Khan on 27/02/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class ProductService:BaseService {
    
    private override init(){}
    
    static func shared() -> ProductService{
        return ProductService()
    }
    
    //MARK:- All Products API
    func getAllProducts(params:ParamsAny, completion: @escaping (_ message: String, _ success: Bool, _ list: ProductListViewModel?, _ responseType:ServiceResponseType)->Void){
        
        let completeURL = EndPoints.BASE_URL + EndPoints.getAllProducts
        self.makePostAPICall(with: completeURL, params: params, headers:self.getHeaders()) { (message, success, json, responseType) in
            if success {
                let list = ProductListViewModel(json![KEY_RESPONSE_DATA])
                completion(message,success,list,responseType)
            }else {
                completion(message,success,nil,responseType)
            }
        }
    }
    
    //MARK:- Upload Product Image
    func uploadProductImage(_ image:UIImage, completion: @escaping (_ message:String,_ success:Bool,_ imageUrl:String?, _ responseType:ServiceResponseType)->Void ) {
        let completeURL = EndPoints.BASE_URL + EndPoints.uploadProductImage
        let imageData = [DictKeys.image:image.jpegData(compressionQuality: 0.75)!]
        self.makePostAPICallWithMultipart(with: completeURL, dict: imageData, params: [:], headers: self.getHeaders()) { (message, success, json, responseType) in
            if success {
                completion(message,success,json![KEY_RESPONSE_DATA].stringValue,responseType)
            }else {
                completion(message,success,nil,responseType)
            }
        }
    }
    
    //MARK:- Add New Prodduct
    func addNewProduct(_ params:ParamsAny, completion: @escaping (_ message:String,_ success:Bool, _ responseType:ServiceResponseType)->Void ) {
        let completeURL = EndPoints.BASE_URL + EndPoints.addProduct
        self.makePostAPICall(with: completeURL, params: params, headers: self.getHeaders()) { (message, success, json, responseType) in
            completion(message,success,responseType)
        }
    }
    
    //MARK:- API UPDATE PRODUCT
    func updateProduct(_ params: Parameters, complition: @escaping (_ message: String, _ success: Bool, _ responseType:ServiceResponseType)-> Void){
        let complateURL = EndPoints.BASE_URL + EndPoints.updateProduct
        self.makePostAPICall(with: complateURL, params: params, headers: self.getHeaders()) { (message, success, json, responseType) in
            complition(message, success,responseType)
        }
    }
    
    //MARK:- Delete product API
    func deleteProduct(_ params: Parameters, complition: @escaping (_ message: String, _ success: Bool, _ responseType:ServiceResponseType)-> Void){
        let complateURL = EndPoints.BASE_URL + EndPoints.deleteProduct
        self.makePostAPICall(with: complateURL, params: params, headers: self.getHeaders()) { (message, success, json, responseType) in
            complition(message, success,responseType)
        }
    }
    
    //MARK:- Delete product API
    func deleteMultipleProducts(_ params: Parameters, complition: @escaping (_ message: String, _ success: Bool, _ responseType:ServiceResponseType)-> Void){
        let complateURL = EndPoints.BASE_URL + EndPoints.deleteMultipleProduct
        self.makePostAPICall(with: complateURL, params: params, headers: self.getHeaders()) { (message, success, json, responseType) in
            complition(message, success,responseType)
        }
    }
    
    //MARK:- Enable Disable product API
    func enableDisableProducts(_ params: Parameters, complition: @escaping (_ message: String, _ success: Bool, _ responseType:ServiceResponseType)-> Void){
        let complateURL = EndPoints.BASE_URL + EndPoints.enableDisableMultipleProduct
        self.makePostAPICall(with: complateURL, params: params, headers: self.getHeaders()) { (message, success, json, responseType) in
            complition(message, success,responseType)
        }
    }
    
}
