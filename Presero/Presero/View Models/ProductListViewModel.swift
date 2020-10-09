//
//  ProductListViewModel.swift
//  TawridSupplier
//
//  Created by Gulfam Khan on 27/02/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import Foundation
import SwiftyJSON

class ProductListViewModel {
    
    //MARK:- data members
    var products:[ProductViewModel]
    
    //MARK:- Init methods
    init() {
        products = []
    }
    
    convenience init(_ jsonDict:JSON) {
        self.init()
        for json in jsonDict.arrayValue {
            let product = ProductViewModel(json)
            self.products.append(product)
        }
    }
}
