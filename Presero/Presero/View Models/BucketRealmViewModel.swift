
import SwiftyJSON
import RealmSwift
import Realm

class BucketRealmViewModel : SwiftyJSONRealmObject {
    
    @objc dynamic var key: String
    @objc dynamic var lastModified: String
    @objc dynamic var eTag: String
    @objc dynamic var size : String
    @objc dynamic var storageClass: String
    
    override static func primaryKey() -> String? {
        return "key"
    }
    
    required init(){
        
        self.key = kBlankString
        self.lastModified = kBlankString
        self.eTag = kBlankString
        self.size = kBlankString
        self.storageClass = kBlankString
        
    }
}





















