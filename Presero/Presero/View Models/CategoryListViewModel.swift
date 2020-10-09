//
//  CatagoryListViewModel.swift
//  Tawrid
//
//  Created by Rizwan Ali on 16/01/2020.
//  Copyright © 2020 Rapidzz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CategoryListViewModel {
    
    var categoryList: [CategoryViewModel]
    
    init() {
        self.categoryList = [CategoryViewModel]()
    }
    
    init(list: JSON) {
        self.categoryList = [CategoryViewModel]()
        
        for json in list.arrayValue {
            self.categoryList.append(CategoryViewModel(data: json))
            
        }
    }
    
}
