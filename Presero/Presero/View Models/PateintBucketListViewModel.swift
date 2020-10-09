import Foundation
import Alamofire
import SwiftyJSON

class PateintBucketListViewModel {
    var buketList: [PateintBucketViewModel]
    
    init() {
        self.buketList = [PateintBucketViewModel]()
    }
    init(list: JSON) {
        self.buketList = [PateintBucketViewModel]()
        let results = list.array
        for bucket in results!{
            self.buketList.append(PateintBucketViewModel(bucket))
        }
    }
}
