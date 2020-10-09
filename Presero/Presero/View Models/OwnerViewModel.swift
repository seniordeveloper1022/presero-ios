//
//  OwnerViewModel.swift
//  Presero
//
//  Created by apple on 9/14/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class OwnerViewModel{
    
    var displayName: String
    var id: String
   
    init() {
        self.displayName = kBlankString
        self.id = kBlankString
    }
    convenience init(_ json:JSON){
        self.init()
        self.displayName = json["DisplayName"].stringValue
        self.id = json["ID"].stringValue
    }
}

