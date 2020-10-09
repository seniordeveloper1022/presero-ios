import Foundation
import SwiftyJSON

class WoundViewModel{
    
    var name: String
    var id: String
    var image : String
    var isSelected : Bool
   
    init() {
        self.name = kBlankString
        self.id = kBlankString
        self.image = kBlankString
        self.isSelected = false
       
        
    }
    
    convenience init(_ json:JSON){
        self.init()
        self.id = json["id"].stringValue
        self.name = json["name"].stringValue
        self.image = json["image"].stringValue
        self.isSelected = false
      
        
    }
    
    
}
