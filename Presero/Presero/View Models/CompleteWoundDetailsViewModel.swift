//
//  TreatmentViewModel.swift
//  Presero
//
//  Created by apple on 9/16/20.
//  Copyright © 2020 apple. All rights reserved.
//


import Foundation
import SwiftyJSON

class CompleteWoundViewModel{
    
    var image : Data
    var woundDetails : [String]
    
    init() {
        self.image = Data()
        self.woundDetails = [String]()
    }
    convenience init(image : Data , woundDetails : [String]){
        self.init()
        self.image = image
        self.woundDetails = woundDetails
    }
}

