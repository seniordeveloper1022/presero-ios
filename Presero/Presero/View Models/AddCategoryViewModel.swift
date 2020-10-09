//
//  UserViewModel.swift
//  GirlsChase
//
//  Created by Rapidzz Macbook on 14/06/2019.
//  Copyright © 2019 Rapidzz. All rights reserved.
//

import Foundation


class AddCategoryViewModel{
    
    var imgCategory:UIImage!
    var name: String!
    var isSelected: Bool!
    
    
    init() {
    }
    
    init(image:UIImage? = nil, name:String) {
        self.name = name
        self.imgCategory = image
        self.isSelected = false
    }
    
}
