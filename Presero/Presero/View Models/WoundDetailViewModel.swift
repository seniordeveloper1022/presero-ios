//
//  WoundDetailsViewModel.swift
//  Presero
//
//  Created by apple on 9/16/20.
//  Copyright © 2020 apple. All rights reserved.

import Foundation
import SwiftyJSON

class WoundDetailViewModel{
    
    var isDeleted: Bool
    var uID: String
    var WoundLocation : String
    var WoundOcurrenceDate : String
    var TreatmentStartDate: String
    var WoundEntryDate: String
    var WoundType: Int
    var HealingPrediction: String
    var HealingEnabled: Bool
    
    init() {
        
        self.isDeleted = false
        self.uID = kBlankString
        self.WoundLocation = kBlankString
        self.WoundOcurrenceDate = kBlankString
        self.TreatmentStartDate = kBlankString
        self.WoundEntryDate = kBlankString
        self.WoundType = 0
        self.HealingPrediction = kBlankString
        self.HealingEnabled = false
        
        
        
        
    }
    
    convenience init(_ json:JSON){
        self.init()
        
        self.isDeleted = json["IsDeleted"].boolValue
        self.uID = json["UID"].stringValue
        self.WoundLocation = json["WoundLocation"].stringValue
        self.WoundOcurrenceDate = json["WoundOcurrenceDate"].stringValue
        self.TreatmentStartDate = json["TreatmentStartDate"].stringValue
        self.WoundEntryDate = json["WoundEntryDate"].stringValue
        self.WoundType = json["WoundType"].intValue
        self.HealingPrediction = json["HealingPrediction"].stringValue
        self.HealingEnabled = json["HealingEnabled"].boolValue
        
        
    }
    
    
}

