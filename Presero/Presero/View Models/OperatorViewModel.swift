//
//  operatorViewModel.swift
//  Presero
//
//  Created by apple on 9/9/20.
//  Copyright © 2020 apple. All rights reserved.
//


import Foundation
import SwiftyJSON

class OperatorViewModel{
    
    var id: String
    var accountId: String
    var deleted: Bool
    var windowsId : String
    var firstName: String
    var middleName: String
    var lastName: String
    var loginName: String
    var email: String
    var encryptedPassword: String
    var showTips: Bool
    var isPersistent: Bool
    var lastClientUpdate: String
    var passwordLastChanged: String
    var isAdmin: Bool
    var isSelected : Bool
    
    init() {
        self.id = kBlankString
        self.accountId = kBlankString
        self.deleted = false
        self.windowsId = kBlankString
         self.firstName = kBlankString
         self.middleName = kBlankString
         self.lastName = kBlankString
         self.loginName = kBlankString
         self.email = kBlankString
         self.encryptedPassword = kBlankString
         self.showTips = false
         self.isPersistent = false
         self.lastClientUpdate = kBlankString
         self.passwordLastChanged = kBlankString
         self.isAdmin = false
        self.isSelected = false
        
    }
    
    convenience init(_ json:JSON){
        self.init()
        self.id = json["Id"].stringValue
        self.accountId = json["accountId"].stringValue
        self.deleted = json["Deleted"].boolValue
        self.windowsId = json["WindowsId"].stringValue
          self.firstName = json["FirstName"].stringValue
          self.middleName = json["MiddleName"].stringValue
          self.lastName = json["LastName"].stringValue
          self.loginName = json["LoginName"].stringValue
          self.email = json["Email"].stringValue
          self.encryptedPassword = json["EncryptedPassword"].stringValue
          self.showTips = json["ShowTips"].boolValue
          self.isPersistent = json["IsPersistent"].boolValue
          self.lastClientUpdate = json["LastClientUpdate"].stringValue
          self.passwordLastChanged = json["PasswordLastChanged"].stringValue
          self.isAdmin = json["IsAdmin"].boolValue
          self.isSelected = false
        self.passwordLastChanged = self.passwordLastChanged.replacingOccurrences(of: "-", with: "-", options: .literal, range: nil)
               var formattedLastScanDate = ""
               for char in self.passwordLastChanged{
                          if(char == "T"){
                              break;
                          }
                          else{
                              formattedLastScanDate.append(char)
                              }
                          }
               self.passwordLastChanged = formattedLastScanDate
        
    }
    
    
}
