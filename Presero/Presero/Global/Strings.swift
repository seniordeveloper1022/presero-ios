
import Foundation
import UIKit


typealias ParamsAny             = [String:Any]
typealias ParamsString          = [String:String]

let ALERT_TITLE_APP_NAME        = "Presero"
let EMAIL_REGULAR_EXPRESSION    = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

struct SideMenu {
    static let MENULIST = [["title":"Home","image":"home1"],
                           ["title":"Profile","image":"profile"],
                           ["title":"Products","image":"product"],
                           ["title":"Categories","image":"categories"],
                           ["title":"Jobs","image":"info"],
                           ["title":"Help Center","image":"info"],
                           ["title":"Settings","image":"setting"],
                           ["title":"Logout","image":"power"]]
}


struct WoundInfo {
   static let WoundTitle = ["Wound name:","Wound Type:","Last Scan:","Area(L x W):","Length:","Width:","Exact Area:","Max Depth:","Volume:","Reduction in exact area, from first scan:","Reduction in volume, from first scan:","Scan taken:"]
       static let WoundDetails = ["Sacral Wound","Pressure UIcer/Injury","01/19/2020","82.5 cm","10.6 cm","7.8 cm","68.3 cm","3.3 cm","111.5 cc","0%","0%","1"]
    static let PreviewWoundTitle = ["Area(L x W):","Length:","Width:","Exact Area:","Max Depth:","Volume:","Reduction in exact area, from first scan:","Reduction in volume, from first scan:"]
    static let PreviewWoundDetails = ["82.5 cm","10.6 cm","7.8 cm","68.3 cm","3.3 cm","111.5 cc","1%","1%"]
}

struct APIKeys {
    static let googleApiKey     = "AIzaSyBTfypSbx_zNMhWSBXMTA2BJBMQO7_9_T8"
}

struct StoryboardNames {
     static let Registration = "Registration"
    static let Main = "Main"
    static let Home = "Home"
    static let Patient = "Patient"
   
}

struct NavigationTitles {
    static let Home                 = "Home"
   static let PatientWound = "Patient Wounds"
    static let AddPatient = "Add Patient"
    static let TreatmentPlan = "Treatment Plan"
    static let WoundDebridement = "Wound Debridement"
    static let PreviewWound = "Preview Wound"
    static let WoundDrainage = "Wound Drainage"
    static let WoundCharacteristics = "Wound Characteristics"
}

struct NotificationName {
    static let UnAuthorizedAccess    = Notification.Name(rawValue: "UnAuthorizedAccess")
}

struct AssetNames {
    static let backArrow            = "Back-arrow"
    static let Logout           = "Logout"
    static let menuIcon             = "menu-icon"
    static let Home                = "Home"
    static let Profile               = "Profile"
    static let Help               = "Help"
    static let Privacy            = "Privacy"
    static let iconProfile          = "Oval"
    static let iconSelectCategory   = "iconCategory"
    static let dotsMenuIcon         = "Dots menu Icon"
    static let OrderImage           = "Group 3"
  
}
struct ServiceMessage {
    static let LocationTitle       = "Location Service Off"
    static let LocationMessage     = "Turn on Location in Settings > Privacy to allow myLUMS to determine your Location"
    static let Settings            = "Settings"
    static let CameraTitle         = "Permission Denied"
    static let CameraMessage       = "Turn on Camera in Settings"
}

struct ControllerIdentifier {
    static let WoundTypeSelectionPopUpViewController = "WoundTypeSelectionPopUpViewController"
    static let EditOperatorViewController = "EditOperatorViewController"
    static let AddOperatorViewController = "AddOperatorViewController"
    static let ManageOperatorsViewController = "ManageOperatorsViewController"
    static let  PreviewWoundImageViewController = "PreviewWoundImageViewController"
    static let EditImageViewController = "EditImageViewController"
    static let WoundCharacteristicsViewController = "WoundCharacteristicsViewController"
    static let PreviewWoundViewController = "PreviewWoundViewController"
    static let WoundDebridementViewController = "WoundDebridementViewController"
    static let AllPatientsViewController = "AllPatientsViewController"
    static let MainContainerViewController = "MainContainerViewController"
    static let HomeBaseNavigationController = "HomeBaseNavigationController"
    static let PatientWoundDetailsViewController = "PatientWoundDetailsViewController"
    static let TreatmentPlanViewController = "TreatmentPlanViewController"
    static let WoundDraingeViewController = "WoundDraingeViewController"
    static let TreatmentPlanDetailsViewController = "TreatmentPlanDetailsViewController"
    static let KYDrawerController = "KYDrawerController"
    static let loginVC = "loginVC"
    static let LoginViewController = "LoginViewController"
    static let SettingsBaseNavigationController = "SettingsVC"
    static let AddPatientViewController = "AddPatientViewController"

   
}

struct ValidationMessages {
     static let VerifyNumber = "Please Verify Your Number"
    static let EmptyPhonNumber = "Please enter phone number"
     static let SomeThingWrong = "SomeThingWrong"
    static let PhoneNumberVerified = "PhoneNumber Verified Successfully"
     static let WrondPinCode = "Please Enter A Valid VerificationCode"
    static let loginSuccessfully            = "You are logged in"
    static let selectProfileimage           = "Select Profile Image"
    static let emptyName                    = "Please enter your name"
    static let emptyEmail                   = "Please enter your email"
    static let enterValidEmail              = "Please enter valid email"
    static let emptyPassword                = "Password field cannot be empty"
    static let shortPassword                = "Password must be atleast 6 characters"
    static let reTypePassword               = "Please re-type password"
    static let nonMatchingPassword          = "Password is not matching"
    static let invalidPhoneNumber           = "Enter a valid phone number"
    static let configurationUrl             = "Please enter configuration url"
    static let validUrl                     = "Please enter valid url"
    static let emptyPhonNumber              = "Please enter phone number"
    static let emptyPincode                 = "Please enter pincode from email to continue"
    static let emptyCategoryName            = "Please enter category name first"
    static let emptyProductName             = "Please enter product name first"
    static let invalidProductPrice          = "Please enter a valid price for product"
    static let emptyProductInfo             = "Please describe product briefly"
    static let noImageProduct               = "Add at least one image of product"
    static let selectWeightUnit             = "Select product weight unit first"
    static let commentsMissing              = "Comment field cannot empty"
    static let noLocationAdded              = "Location info is must in order to become a supplier"
    static let fillAllFields              = "Please fill all fields"
}
struct CellIdentifier {
    static let WoundCollectionViewCell = "WoundCollectionViewCell"
    static let SettingsMenuTableViewCell = "SettingsMenuTableViewCell"
    static let ManageOperatorTableViewCell = "ManageOperatorTableViewCell"
    static let OperatorTableViewCell = "OperatorTableViewCell"
    static let InjuryTypeTableViewCell = "InjuryTypeTableViewCell"
   static let PatientTableViewCell = "PatientTableViewCell"
    static let PatientWoundDetailsTableViewCell = "PatientWoundDetailsTableViewCell"
    static let WoundDetailsCollectionViewCell = "WoundDetailsCollectionViewCell"
    static let PreviewWoundCommentTableViewCell = "PreviewWoundCommentTableViewCell"
    static let TreatmentPlanDetailsTableViewCell = "TreatmentPlanDetailsTableViewCell"
    static let sideMenuCell = "sideMenuCell"
}

struct PopupMessages {
    static let emptySearch = "Please enter something for search"
    static let verification = "Verification Code Sent Again Successfully"
    static let LocationNotFound             = "Location Not found"
    static let cantSendMessage              = "Cant Send Message Now Please Try Agian Later"
    static let warning                      = "Warning"
    static let sureToLogout                 = "Are you sure to logout"
    static let nothingToUpdate              = "Nothing to update"
    static let orderMarkedCompleted         = "Order marked completed successfullly"
    static let unAuthorizedAccessMessage    = "Session expired, please login again"
    static let cameraPermissionNeeded       = "Camera permission needed to scan QR Code. Goto settings to enable camera permission"
    static let SomethingWentWrong           = "Something went wrong, please check your internet connection or try again later!"
}

struct OrderStatus {
    static let inProgress   = "inprocess"
    static let cancelled    = "cancelled"
    static let delivered    = "delivered"
    static let preparing    = "preparing"
}

struct ProductMenu {
    static let delete       = "Delete Product"
    static let enable       = "Enable Product"
    static let disable      = "Disable Product"
}

struct LocalStrings {
    static let success              = "Success"
    static let ok                   = "OK"
    static let Yes                  = "Yes"
    static let No                   = "No"
    static let edit                 = "Edit"
    static let delete               = "Delete"
    static let Cancel               = "Cancel"
    static let Camera               = "Camera"
    static let complete             = "COMPLETE"
    static let prepare              = "PREPARE"
    static let update               = "UPDATE"
    static let NoDataFound          = "No data found"
    static let EnterUsername        = "Enter Username"
    static let EnterEmail           = "Enter Email"
    static let OldPassword          = "Old Password"
    static let EnterOldPassword     = "Enter old password"
    static let ChangePassword       = "CHANGE PASSWORD"
    static let noDescription        = "No description available"
    static let cancellationReason   = "Cancellation Reason"
    static let deleteProduct        = "Please Select Product To Delete"
    static let enableProduct        = "Please Select Product To Enable"
    static let disableProduct       = "Please Select Product To Disable"
    static let EmptySubject        = "Please Enter Subject"
    static let EmptyMessage        = "Please Enter Message"
}


struct AppFonts {
    static func CenturyGolthicBoldWith(size : CGFloat) -> UIFont {
        
        if let font = UIFont(name: "Century Gothic Bold", size: size) {
            return font
        }
        else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    static func CenturyGolthicRegularWith(size : CGFloat) -> UIFont {
        
        if let font = UIFont(name: "Century Gothic Regular", size: size) {
            return font
        }
        else {
            return UIFont.systemFont(ofSize: size)
        }
    }
}
