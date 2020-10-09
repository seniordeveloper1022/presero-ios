//
//  MassUnitViewModel.swift
//  TawridSupplier
//
//  Created by Gulfam Khan on 28/02/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import Foundation
import SwiftyJSON

class MassUnitViewModel {
    
    //MARK:- data members
    var name:String
    var type:String
    var symbol:String
    
    //MARK:- Init methods
    init() {
        name = kBlankString
        type = kBlankString
        symbol = kBlankString
    }
    
    convenience init(_ jsonDict:JSON) {
        self.init()
        name = jsonDict["name"].stringValue
        type = jsonDict["type"].stringValue
        symbol = jsonDict["symbol"].stringValue
    }
}
