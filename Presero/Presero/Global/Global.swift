import Foundation
import UIKit
import StoreKit

class Global {
    class var shared : Global {
        
        struct Static {
            static let instance : Global = Global()
        }
        return Static.instance
    }
    var user:UserViewModel!
    var operatorList = OperatorListViewModel()
    var isLogedIn:Bool = false
    var fcmToken:String = "some dummy text for now"
    var url: String  = "http://110.36.237.219"
    var systemVersion = UIDevice.current.systemVersion
    var deviceModel = UIDevice.modelName
    var drawerController: KYDrawerController?
    var controllerTitle = ""
       var currentNavigationController = ""
       var currentStoryBoard = ""
    var token = ""
    var treatmentPlan = ScanDetailsViewModel()
    var userKey = ""
    var selectPateint : PateintViewModel?
       
    
  }

