import Foundation
import SwiftyJSON

class ImageCroppedViewModel{
    
    var image: UIImage
    var IsCrop: Bool
    var height : Int
    var width : Int
   
    init() {
        self.image = UIImage()
        self.IsCrop = false
        self.height = -1
        self.width = -1
       
        
    }
}
