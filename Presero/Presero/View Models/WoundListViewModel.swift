import Foundation
import Alamofire
import SwiftyJSON

class WoundListViewModel {
    var woundList: [WoundViewModel]
    
    init() {
        self.woundList = [WoundViewModel]()
    }
    init(list: JSON) {
        self.woundList = [WoundViewModel]()
        let results = list.array
        for wound in results!{
            self.woundList.append(WoundViewModel(wound))
        }
    }
}
