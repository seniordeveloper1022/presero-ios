import Foundation
import Alamofire
import SwiftyJSON

class OperatorListViewModel {
    var operatorList: [OperatorViewModel]
    
    init() {
        self.operatorList = [OperatorViewModel]()
    }
    init(list: JSON) {
        self.operatorList = [OperatorViewModel]()
        let results = list.array
        if let dataList = results{
        for operatr in dataList{
            self.operatorList.append(OperatorViewModel(operatr))
        }
      }
    }
}
