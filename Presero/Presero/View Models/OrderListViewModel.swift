//
//  OrderListViewModel.swift
//  TawridSupplier
//
//  Created by Gulfam Khan on 09/03/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import Foundation
import SwiftyJSON

class OrderListViewModel {
    
    //MARK:- data members
    var currentOrders: [OrderViewModel]
    var historyOrders: [OrderViewModel]
    
    //MARK:- Init methods
    init() {
        currentOrders = []
        historyOrders = []
    }
    
    convenience init(_ jsonDict:JSON) {
        self.init()
        currentOrders = jsonDict["current"].arrayValue.map {OrderViewModel($0)}
        historyOrders = jsonDict["history"].arrayValue.map {OrderViewModel($0)}
    }
}
