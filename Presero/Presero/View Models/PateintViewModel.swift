//
//  UserViewModel.swift
//  GirlsChase
//
//  Created by Rapidzz Macbook on 14/06/2019.
//  Copyright © 2019 Rapidzz. All rights reserved.
//

import Foundation
import SwiftyJSON




class PateintViewModel{
    
    var id: String
    var patientId: String
    var patientName: String
    var patientLastName : String
    var comments : String
    var isTransient : Bool
    var isActive : Bool
    var operatorName : String
    var originalPatientId : Int
    var operatorId : String
    var admissionDate : String
    var patientEndDate : String
    var lastClientUpdate : String
    var birthDate : String
    var patientType : Int
    var lastScanDate : String
    var accountID : String
    var facility : String
    
    init() {
        self.id = kBlankString
        self.patientId = kBlankString
        self.patientName = kBlankString
        self.patientLastName = kBlankString
        self.comments = kBlankString
        self.isTransient = false
        self.isActive = false
        self.operatorName = kBlankString
        self.originalPatientId = -100
        self.operatorId = kBlankString
        self.admissionDate = kBlankString
        self.patientEndDate = kBlankString
        self.lastClientUpdate = kBlankString
        self.birthDate = kBlankString
        self.patientType = -1
        self.lastScanDate = kBlankString
        self.accountID = kBlankString
        self.facility = kBlankString
    }
    convenience init(_ json:JSON){
        self.init()
        self.id = json["ID"].stringValue
        self.patientId = json["PatientId"].stringValue
        self.patientName = json["PatientName"].stringValue
        self.patientLastName = json["PatientLastName"].stringValue
        self.comments = json["Comments"].stringValue
        self.isTransient = json["IsTransient"].boolValue
        self.isActive = json["IsActive"].boolValue
        self.operatorName = json["OperatorName"].stringValue
        self.originalPatientId = json["OriginalPatientId"].intValue
        self.operatorId = json["OperatorId"].stringValue
        self.admissionDate = json["AdmissionDate"].stringValue
        self.patientEndDate = json["PatientEndDate"].stringValue
        self.lastClientUpdate = json["LastClientUpdate"].stringValue
        self.birthDate = json["BirthDate"].stringValue
        self.patientType = json["PatientType"].intValue
        self.lastScanDate = json["LastScanDate"].stringValue
        self.accountID = json["accountID"].stringValue
        self.facility = json["Facility"].stringValue
        
        self.birthDate = self.birthDate.replacingOccurrences(of: "-", with: "/", options: .literal, range: nil)
        var formattedDateOfBirth = ""
        for char in self.birthDate{
            if(char == "T"){
                break;
            }
            else{
                formattedDateOfBirth.append(char)
                }
            }
        self.birthDate = formattedDateOfBirth
        self.lastScanDate = self.lastScanDate.replacingOccurrences(of: "-", with: "/", options: .literal, range: nil)
        var formattedLastScanDate = ""
        for char in self.lastScanDate{
                   if(char == "T"){
                       break;
                   }
                   else{
                       formattedLastScanDate.append(char)
                       }
                   }
        self.lastScanDate = formattedLastScanDate
        var formattedadmissionDate = ""
               for char in self.admissionDate{
                          if(char == "T"){
                              break;
                          }
                          else{
                              formattedadmissionDate.append(char)
                              }
                          }
               self.admissionDate = formattedadmissionDate
    }
}
