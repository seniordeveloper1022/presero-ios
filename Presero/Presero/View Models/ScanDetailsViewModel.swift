//
//  WoundDetailsViewModel.swift
//  Presero
//
//  Created by apple on 9/16/20.
//  Copyright © 2020 apple. All rights reserved.

import Foundation
import SwiftyJSON

class ScanDetailsViewModel{
    var treatment : TreatmentViewModel
    var isDeleted: Bool
    var uID: Double
    var presentationVolume : Double
    var circumference : Double
    var maxDepth: Double
    var bodyAngle: Double
    var width: Double
    var length: Double
    var calibrationFactor: Double
    var area: Double
    var realArea: Double
    var dateTimeOfScan: String
    var operatorId: String
    var comments: String
    var deviceID: String
    var operatorName: String
    
    
   
    init() {
        self.treatment = TreatmentViewModel()
        self.isDeleted = false
        self.uID = 0.0
        self.presentationVolume = 0.0
        self.circumference = 0.0
         self.maxDepth = 0.0
         self.bodyAngle = 0.0
         self.width = 0.0
         self.length = 0.0
         self.calibrationFactor = 0.0
         self.area = 0.0
         self.realArea = 0.0
         self.dateTimeOfScan = kBlankString
         self.operatorId = kBlankString
         self.comments = kBlankString
         self.deviceID = kBlankString
         self.operatorName = kBlankString
         
        
       
        
    }
    
    convenience init(_ json:JSON){
        self.init()
        self.treatment = TreatmentViewModel(json["Treatment"])
        self.isDeleted = json["IsDeleted"].boolValue
        self.uID = json["UID"].doubleValue
        self.presentationVolume = json["PresentationVolume"].doubleValue
        self.circumference = json["Circumference"].doubleValue
         self.maxDepth = json["MaxDepth"].doubleValue
         self.bodyAngle = json["BodyAngle"].doubleValue
         self.width = json["Width"].doubleValue
         self.length = json["Length"].doubleValue
         self.calibrationFactor = json["CalibrationFactor"].doubleValue
         self.area = json["Area"].doubleValue
         self.realArea = json["RealArea"].doubleValue
         self.dateTimeOfScan = json["DateTimeOfScan"].stringValue
         self.operatorId = json["OperatorId"].stringValue
         self.comments = json["Comments"].stringValue
         self.deviceID = json["DeviceID"].stringValue
         self.operatorName = json["OperatorName"].stringValue
        
        self.dateTimeOfScan = self.dateTimeOfScan.replacingOccurrences(of: "-", with: "/", options: .literal, range: nil)
        var formattedLastScanDate = ""
        for char in self.dateTimeOfScan{
                   if(char == "T"){
                       break;
                   }
                   else{
                       formattedLastScanDate.append(char)
                       }
                   }
        self.dateTimeOfScan = formattedLastScanDate
      
        
    }
    
    
}

