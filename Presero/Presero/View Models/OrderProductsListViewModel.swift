//
//  OrderProductsListViewModel.swift
//  TawridSupplier
//
//  Created by Gulfam Khan on 09/03/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import Foundation
import SwiftyJSON

class OrderProductsListViewModel {
    
    //MARK:- data members
    var products: [OrderProductsViewModel]
    
    //MARK:- Init methods
    init() {
        products = []
    }
    
    convenience init(_ jsonDict:JSON) {
        self.init()
        products = jsonDict.arrayValue.map {OrderProductsViewModel($0)}
    }
}
