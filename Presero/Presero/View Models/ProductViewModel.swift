import Foundation
import Alamofire
import SwiftyJSON

class ProductViewModel {
    
    var id                  : Int
    var supplierId          : Int
    var status              : Int
    var categoryId          : Int
    var favouriteId         : Int
    var isActive            : Int
    var supplierActive      : Int
    var images              : [String]
    var price               : String
    var name                : String
    var type                : String
    var quantity            : String
    var description         : String
    var created_at          : String
    var updated_at          : String
    
    init() {
        self.id                 = kInt0
        self.supplierId         = kInt0
        self.status             = kInt0
        self.categoryId         = kInt0
        self.favouriteId        = kInt0
        self.isActive           = kInt0
        self.supplierActive     = kInt0
        self.images             = []
        self.price              = kBlankString
        self.name               = kBlankString
        self.type               = kBlankString
        self.quantity           = kBlankString
        self.description        = kBlankString
        self.created_at         = kBlankString
        self.updated_at         = kBlankString
    }
    
    convenience init(_ data: JSON) {
        self.init()
        self.id                 = data["id"].intValue
        self.supplierId         = data["supplier_id"].intValue
        self.favouriteId        = data["favourite_id"].intValue
        self.status             = data["status"].intValue
        self.categoryId         = data["category_id"].intValue
        self.isActive           = data["is_active"].intValue
        self.supplierActive     = data["supplier_active"].intValue
        self.price              = data["price"].stringValue
        self.name               = data["name"].stringValue
        self.type               = data["type"].stringValue
        self.quantity           = data["quantity"].stringValue
        self.description        = data["description"].stringValue
        self.created_at         = data["created_at"].stringValue
        self.updated_at         = data["updated_at"].stringValue
        
        for json in data["image"].arrayValue {
            self.images.append(json.stringValue)
        }
    }
}


