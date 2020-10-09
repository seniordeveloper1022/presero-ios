//
//  OrderViewModel.swift
//  TawridSupplier
//
//  Created by Gulfam Khan on 09/03/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import Foundation
import SwiftyJSON

class OrderViewModel {

    let orderId: Int
    let image: String
    let name: String
    let address: String
    let phoneNum: String
    let amount: Int
    let quantity: Int
    let lat: String
    let lng: String
    let comment: String
    let orderStatus: String
    let description: String
    let deliveryTime:String
    let createdAt: String
    let updatedAt: String

    init(_ json: JSON) {
        orderId = json["order_id"].intValue
        image = json["image"].stringValue
        name = json["name"].stringValue
        address = json["address"].stringValue
        phoneNum = json["phone_num"].stringValue
        amount = json["amount"].intValue
        quantity = json["quantity"].intValue
        lat = json["lat"].stringValue
        lng = json["lng"].stringValue
        comment = json["comment"].stringValue
        orderStatus = json["order_status"].stringValue
        description = json["description"].stringValue
        deliveryTime = json["delivery_time"].stringValue
        createdAt = json["created_at"].stringValue
        updatedAt = json["updated_at"].stringValue
    }

}
