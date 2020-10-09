

import Foundation
import Alamofire
import SwiftyJSON

class OperatorServices: BaseService {
    
    //MARK:- Shared Instance
    private override init() {}
    static func shared() -> OperatorServices {
        return OperatorServices()
    }
    
    func addOperators(params:Parameters?,completion: @escaping (_ message: String, _ success: Bool)->Void){
                 let completeURL = EndPoints.BASE_URL
               //  let header:HTTPHeaders = [DictKeys.authoraization:Global.shared.user?.token ?? kBlankString]
                 self.makePostAPICall(with: completeURL, params: params!) { (message, success, json, responseType) in
                  if(success){
                  //let pateintList = PateintListViewModel(list: json!["result"])
                     completion(message,success)
                  }
                  else{
                      completion(message,success)
                  }
              }
          }
    func updateOperators(params:Parameters?,completion: @escaping (_ message: String, _ success: Bool)->Void){
                    let completeURL = EndPoints.BASE_URL
                  //  let header:HTTPHeaders = [DictKeys.authoraization:Global.shared.user?.token ?? kBlankString]
                    self.makePostAPICall(with: completeURL, params: params) { (message, success, json, responseType) in
                     if(success){
                     //let pateintList = PateintListViewModel(list: json!["result"])
                        completion(message,success)
                     }
                     else{
                         completion(message,success)
                     }
                 }
             }
    func addTreatment(params:Parameters?,completion: @escaping (_ message: String, _ success: Bool)->Void){
                    let completeURL = EndPoints.BASE_URL
                  //  let header:HTTPHeaders = [DictKeys.authoraization:Global.shared.user?.token ?? kBlankString]
                    self.makePostAPICall(with: completeURL, params: params) { (message, success, json, responseType) in
                     if(success){
                     //let pateintList = PateintListViewModel(list: json!["result"])
                        completion(message,success)
                     }
                     else{
                         completion(message,success)
                     }
                 }
             }
    
    
}
