
//
import RealmSwift
import SwiftyJSON
/**
 SwiftyJSONRealmObject
 - Description : Object derived from Realm object and is the base for all the objects that want be mapped from JSON
 */
class  SwiftyJSONRealmObject: Object {
  required convenience init(_ json: JSON) {
    self.init()
  }
  class func createList<T>(ofType type: T.Type, fromJson json: JSON) -> List<T> where T: SwiftyJSONRealmObject {
    let list = List<T>()
    for (_, singleJson):(String, JSON) in json {
      list.append(T(singleJson))
    }
    return list
  }
}
