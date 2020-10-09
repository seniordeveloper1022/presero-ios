import Foundation
import UIKit
struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}
struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_X_All = (UIDevice.current.userInterfaceIdiom == .phone && (ScreenSize.SCREEN_MAX_LENGTH == 812 || ScreenSize.SCREEN_MAX_LENGTH == 896))
    static let IS_IPHONE_X = (UIDevice.current.userInterfaceIdiom == .phone && (ScreenSize.SCREEN_MAX_LENGTH == 812))
    static let IS_IPHONE_X_MAX = (UIDevice.current.userInterfaceIdiom == .phone && (ScreenSize.SCREEN_MAX_LENGTH == 896))
    static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
}

struct AppColors {
    static let yellow           = UIColor(rgbValues: 249, green: 177, blue: 31, alpha: 1)
    static let LightGray        = UIColor.init(hexFromString: "0x969696", alpha: 0.61)
    static let LightBlue        = UIColor.init(hexFromString: "0x093485", alpha: 0.61)
    static let Gray             = UIColor.init(hexFromString: "0x969696")
    static let DarkBlue         = UIColor.init(hexFromString: "0x093485")
}

struct DictKeys {
        static let formattedAddress = "formatted_address"
    static let results = "results"
    static let userId               = "user_id"
    static let apiUrl               = "apiurl"
    static let password             = "password"
    static let status               = "status"
    static let bookingType          = "booking_type"
    static let bookingRef           = "booking_ref"
    static let name                 = "name"
    static let email                = "email"
    static let image                = "image"
    static let lat                  = "lat"
    static let lng                  = "lng"
    static let address              = "address"
    static let comment              = "comment"
    static let phoneNumber          = "phone_num"
    static let fcmToken             = "fcm_token"
    static let authoraization       = "Authorization"
    static let pincode              = "pincode"
    static let supplierId           = "supplier_id"
    static let categoryName         = "category_name"
    static let categoryID           = "category_id"
    static let description          = "description"
    static let type                 = "type"
    static let quantity             = "quantity"
    static let price                = "price"
    static let productId            = "product_id"
    static let orderId              = "order_id"
    static let deliveryTime         = "delivery_time"
    static let notificationStatus   = "notification_status"
    static let oldPassword          = "old_password"
    static let newPassword          = "new_password"
    
    
    
    
    static let PatientLastName = "PatientLastName"
    static let PatientName = "PatientName"
    static let Comments = "Comments"
    static let AdmissionDate = "AdmissionDate"
    static let BirthDate = "BirthDate"
    static let LastClientUpdate = "LastClientUpdate"
    static let LastScanDate = "LastScanDate"
    static let OperatorId = "OperatorId"
    static let OperatorName = "OperatorName"
    static let OriginalPatientId = "OriginalPatientId"
    static let PatientEndDate = "PatientEndDate"
    static let PatientType = "PatientType"
    static let IsActive = "IsActive"
    static let NewPatient = "new_patient"
    static let token = "token"
    static let addPatient = "add_patient"
    static let PatientId = "PatientId"
    static let updatePatient = "update_patient"
    static let id = "id"
    static let deleted = "Deleted"
    
}

struct EndPoints {
    static let API_BASE_URL = "https://www.mashghol.com/preseroapis/"
    static let BASE_URL                         = "https://www.mashghol.com/preseroapis/aws_request_sample.php"
    static let logout                           = "logout"
    static let login                            = "login"
    static let addPatient                       = "add_patient"
    
    static let Register                         = "register"
    static let updateProfile                    = "profile-update"
    static let forgotPassword                   = "forget-password"
    static let updatePassword                   = "new-password"
    static let changePassword                   = "change-password"
    static let getAllCategories                 = "all-category"
    static let getAllProducts                   = "product-list"
    static let requestNewCategory               = "add-category-request"
    static let uploadProductImage               = "image-upload"
    static let addProduct                       = "add-product"
    static let updateProduct                    = "update-product"
    static let deleteProduct                    = "delete-product"
    static let getOrderList                     = "order-list"
    static let orderDetails                     = "order-detail"
    static let orderCancel                      = "order-cancel"
    static let orderAccept                      = "order-accept"
    static let completeOrder                    = "order-complete"
    static let jobOrders                        = "job-order"
    static let notificationSettings             = "notification-enabled-disabled"
    static let deleteMultipleProduct            = "multiple-delete-product"
    static let enableDisableMultipleProduct     = "multiple-product-enabled-disabled"
    
}

//Default values for data types
let kBlankString = ""
let Plateform = "IOS"
let DeviceToken = "21321312"

let kInt0 = 0
let kIntDefault = -1

let kDouble0 = 0.0
let kDoubleDefault = -1.0

let kFileTypePDF = "pdf"
let kFileTypeJpeg = "jpeg"

let kMimeTypeImage = "image/png"
let kImageFileName = "file.png"

let kMimeTypePDF = "application/pdf"
let kPDFFileName = "document.pdf"



