//
//  AllCategoryViewModel.swift
//  Tawrid
//
//  Created by Rizwan Ali on 16/01/2020.
//  Copyright © 2020 Rapidzz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CategoryViewModel {
    
    var id                  : Int
    var name                : String
    var image               : String
    var status              : String
    var updated_at          : String
    var created_at          : String
    
    init() {
        self.id             = kInt0
        self.name           = kBlankString
        self.image          = kBlankString
        self.image          = kBlankString
        self.status         = kBlankString
        self.updated_at     = kBlankString
        self.created_at     = kBlankString
    }
    
    init(data: JSON) {
        self.id                 = data["id"].intValue
        self.name               = data["name"].stringValue
        self.image              = data["image"].stringValue
        self.status             = data["status"].stringValue
        self.created_at         = data["created_at"].stringValue
        self.updated_at         = data["updated_at"].stringValue
    }
}


