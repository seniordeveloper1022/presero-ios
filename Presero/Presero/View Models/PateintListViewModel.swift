import Foundation
import Alamofire
import SwiftyJSON

class PateintListViewModel {
    var pateintList: [PateintViewModel]
    
    init() {
        self.pateintList = [PateintViewModel]()
    }
    init(list: JSON) {
        self.pateintList = [PateintViewModel]()
        let results = list.array
        if let listData = results{
        for pateint in listData{
            self.pateintList.append(PateintViewModel(pateint))
        }
    }
}
}
