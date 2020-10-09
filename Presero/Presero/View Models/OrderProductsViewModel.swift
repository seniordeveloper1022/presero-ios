//
//  OrderProductViewModel.swift
//  TawridSupplier
//
//  Created by Gulfam Khan on 09/03/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import Foundation
import SwiftyJSON

class OrderProductsViewModel {
    
    //MARK:- data members
    var orderId:Int
    var name:String
    var price:Int
    var type:String
    var image:String
    var quantity:Int
    var createdAt:String
    var updatedAt:String
    
    //MARK:- Init methods
    init() {
        orderId = kInt0
        name = kBlankString
        price = kInt0
        type = kBlankString
        image = kBlankString
        quantity = kInt0
        createdAt = kBlankString
        updatedAt = kBlankString
    }
    
    convenience init(_ jsonDict:JSON) {
        self.init()
        orderId = jsonDict["order_id"].intValue
        name = jsonDict["product_name"].stringValue
        type = jsonDict["type"].stringValue
        price = jsonDict["product_price"].intValue
        image = jsonDict["image"].stringValue
        quantity = jsonDict["quantity"].intValue
        createdAt = jsonDict["created_at"].stringValue
        updatedAt = jsonDict["updated_at"].stringValue
    }
}
