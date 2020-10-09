//
//  TreatmentViewModel.swift
//  Presero
//
//  Created by apple on 9/16/20.
//  Copyright © 2020 apple. All rights reserved.
//


import Foundation
import SwiftyJSON

class TreatmentViewModel{
    
    var antimicrobialNeeded: Bool
    var fillerNeeded: Bool
    var drainage : Int
    var debridementNeeded : Bool
    var size: Int
    var woundTypeImagesIndex: Int
    var haveCharacteristicsChanged : Bool
    var characteristicsChanged : Int
    
    init() {
        self.antimicrobialNeeded = false
        self.fillerNeeded = false
        self.drainage = -1
        self.size = -1
        self.debridementNeeded = false
        self.woundTypeImagesIndex = -1
        self.haveCharacteristicsChanged = false
        self.characteristicsChanged = -1
        
        
        
    }
    
    convenience init(_ json:JSON){
        self.init()
        self.antimicrobialNeeded = json["AntimicrobialNeeded"].boolValue
        self.fillerNeeded = json["FillerNeeded"].boolValue
        self.drainage = json["Drainage"].intValue
        self.size = json["Size"].intValue
        self.debridementNeeded = json["DebridementNeeded"].boolValue
        self.woundTypeImagesIndex = json["WoundTypeImagesIndex"].intValue
        self.haveCharacteristicsChanged = json["HaveCharacteristicsChanged"].boolValue
        self.characteristicsChanged = json["CharacteristicsChanged"].intValue
        
        
    }
    
    
}

