

import Foundation
import Alamofire
import SwiftyJSON

class PateintServices: BaseService {
    
    //MARK:- Shared Instance
    private override init() {}
    static func shared() -> PateintServices {
        return PateintServices()
    }
    
    fileprivate func saveUserInfo(_ userInfo:UserViewModel) {
        Global.shared.user = userInfo
        UserDefaultsManager.shared.isUserLoggedIn = true
        UserDefaultsManager.shared.userInfo = userInfo
    }
    
    func getPateints(params:Parameters?,completion: @escaping (_ message: String, _ success: Bool , _ pateintList : PateintListViewModel?)->Void){
        let completeURL = EndPoints.BASE_URL
        //  let header:HTTPHeaders = [DictKeys.authoraization:Global.shared.user?.token ?? kBlankString]
        self.makePostAPICall(with: completeURL, params: params) { (message, success, json, responseType) in
            if(success){
                if let data = json{
                    let pateintList = PateintListViewModel(list: data["result"])
                    completion(message,success,pateintList)
                }
                else{
                    completion(message,success,nil)
                }
            }
            else{
                completion(message,success,nil)
            }
        }
    }
    func addPatient(params:Parameters?,completion: @escaping (_ message: String, _ success: Bool , _ response : Any?)->Void){
        
        let completeURL = EndPoints.BASE_URL
        self.makePostAPICall(with: completeURL, params: params) { (message, success, json, responseType) in
            completion(message,success,nil)
        }
    }
    func getPateintBucketData(params:Parameters?,completion: @escaping (_ message: String, _ success: Bool , _ bucketList : PateintBucketListViewModel?)->Void){
        let completeURL = EndPoints.BASE_URL
        //  let header:HTTPHeaders = [DictKeys.authoraization:Global.shared.user?.token ?? kBlankString]
        self.makePostAPICall(with: completeURL, params: params) { (message, success, json, responseType) in
            if(success){
                if let data = json{
                    let bucketList = PateintBucketListViewModel(list: data["result"])
                    completion(message,success,bucketList)
                }
                else{
                    completion(message,success,nil)
                }
            }
            else{
                completion(message,success,nil)
            }
        }
    }
    func getWoundData(params:Parameters?,completion: @escaping (_ message: String, _ success: Bool , _ woundList : WoundListViewModel?)->Void){
        let completeURL = EndPoints.BASE_URL
        //  let header:HTTPHeaders = [DictKeys.authoraization:Global.shared.user?.token ?? kBlankString]
        self.makePostAPICall(with: completeURL, params: params) { (message, success, json, responseType) in
            if(success){
                if let data = json{
                    let woundList = WoundListViewModel(list: data["result"])
                    completion(message,success,woundList)
                }
                else{
                    completion(message,success,nil)
                }
                
            }
            else{
                completion(message,success,nil)
            }
        }
    }
    func getScanData(params:Parameters?,completion: @escaping (_ message: String, _ success: Bool ,_ woundData : ScanDetailsViewModel?)->Void){
        let completeURL = EndPoints.BASE_URL
        //  let header:HTTPHeaders = [DictKeys.authoraization:Global.shared.user?.token ?? kBlankString]
        self.makePostAPICall(with: completeURL, params: params) { (message, success, json, responseType) in
            if(success){
                if let data = json{
                    let woundData = ScanDetailsViewModel(data)
                    completion(message,success , woundData)
                }
                else{
                    completion(message,success, nil)
                }
            }
            else{
                completion(message,success, nil)
            }
        }
    }
    func getWoundDetailsData(params:Parameters?,completion: @escaping (_ message: String, _ success: Bool, _ otherWoundData : WoundDetailViewModel?)->Void){
        let completeURL = EndPoints.BASE_URL
        //  let header:HTTPHeaders = [DictKeys.authoraization:Global.shared.user?.token ?? kBlankString]
        self.makePostAPICall(with: completeURL, params: params) { (message, success, json, responseType) in
            if(success){
                if let data = json{
                    let otherWoundData = WoundDetailViewModel(data)
                    completion(message,success, otherWoundData)
                }
                else{
                    completion(message,success, nil)
                }
            }
            else{
                completion(message,success, nil)
            }
        }
    }
    func getWoundImageData(params:Parameters?,completion: @escaping (_ message: String, _ success: Bool, _ image : UIImage?)->Void){
         let completeURL = EndPoints.BASE_URL
         //  let header:HTTPHeaders = [DictKeys.authoraization:Global.shared.user?.token ?? kBlankString]
         self.makePostAPICallImage(with: completeURL, params: params) { (message, success, json, responseType) in
             if(success){
                 if let data = json{
                    let image = UIImage(data: data)
                     completion(message,success, image)
                 }
                 else{
                     completion(message,success, nil)
                 }
             }
             else{
                 completion(message,success, nil)
             }
         }
     }
    func addWound(params:ParamsAny?,image : Data?,completion: @escaping (_ message: String, _ success: Bool)->Void){
        let completeURL = EndPoints.BASE_URL
        //  let header:HTTPHeaders = [DictKeys.authoraization:Global.shared.user?.token ?? kBlankString]
        var imageDict = [String : Data]()
        if let woundImage = image{
              imageDict = ["image": woundImage]
        }
        self.makePostAPICallWithMultipart(with: completeURL, dict: imageDict, params: params!, completion: { (message, success, json, responseType) in
            if(success){
                if let data = json{
                    print(data)
                  //  let otherWoundData = WoundDetailViewModel(data)
                    completion(message,success)
                }
                else{
                    completion(message,success)
                }
            }
            else{
                completion(message,success)
            }
        })
    }
}
