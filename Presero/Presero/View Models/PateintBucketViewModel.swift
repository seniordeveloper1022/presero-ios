//
//  operatorViewModel.swift
//  Presero
//
//  Created by apple on 9/9/20.
//  Copyright © 2020 apple. All rights reserved.
//


import Foundation
import SwiftyJSON

class PateintBucketViewModel{
    
    var key: String
    var lastModified: String
    var eTag: String
    var size : String
    var storageClass: String
    var owner: OwnerViewModel
   
    init() {
        self.key = kBlankString
        self.lastModified = kBlankString
        self.eTag = kBlankString
        self.size = kBlankString
         self.storageClass = kBlankString
         self.owner = OwnerViewModel()
        
    }
    
    convenience init(_ json:JSON){
        self.init()
        self.key = json["Key"].stringValue
        self.lastModified = json["LastModified"].stringValue
        self.eTag = json["ETag"].stringValue
        self.size = json["Size"].stringValue
        self.storageClass = json["StorageClass"].stringValue
        self.owner = OwnerViewModel(json["Owner"])
          
        
    }
    
    
}
