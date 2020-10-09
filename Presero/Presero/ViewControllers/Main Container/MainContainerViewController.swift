//
//  MainContainerViewController.swift
//  SimSwitch
//
//  Created by Gulfam Khan on 30/10/2019.
//  Copyright © 2019 Rapidzz. All rights reserved.
//

import UIKit

class MainContainerViewController: BaseViewController{
    
    @IBOutlet weak var widthMenuButton: NSLayoutConstraint!
    @IBOutlet weak var btnWoundDetails: UIButton!
    @IBOutlet weak var btnRightMenu: UIButton!
    @IBOutlet weak var txtfSearch: UITextField!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var topbarView: UIView!
    @IBOutlet weak var viewOptionMenu: UIView!
    
    @IBOutlet weak var btnPateintDetails: UIButton!
    weak var delegate:TopBarDelegate?
    var baseNavigationController: BaseNavigationController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showHomeController()
    }
    
    func setTitle(title:String) {
        self.titleLabel.text = title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let container = self.mainContainer{
            container.setTitle(title: "Settings")
        }
    }
    
    func setMenuButton(isBack:Bool = false)  {
        if(isBack){
            self.btnMenu.removeTarget(nil, action: nil, for: .allEvents)
            self.btnMenu.setImage(UIImage(named: AssetNames.backArrow)!, for: .normal)
            self.btnMenu.addTarget(self, action: #selector(MainContainerViewController.actionBack(_:)), for: .touchUpInside)
        }else{
            self.btnMenu.setImage(UIImage(named: AssetNames.menuIcon)!, for: .normal)
            self.btnMenu.addTarget(self, action: #selector(actionSideMenu(_:)), for: .touchUpInside)
        }
    }
    func setImageBtnRight(setSearchImage: Bool = false, isHiddenImage: Bool = false , image : String){
        self.btnRight.isHidden = false
        if isHiddenImage{
            self.btnRight.isHidden = true
            
        }else if setSearchImage{
            self.btnRight.setImage(UIImage(named: image), for: .normal)
        }else{
            self.btnRight.setImage(UIImage(named: image), for: .normal)
            
            self.btnRight.backgroundColor = UIColor.clear
        }
        
        
    }

//    func setRightButton(imageName:String) {
//
//       // self.setRightButton(shouldHide: false, imageName: imageName, title: kBlankString)
//    }
//
//    func setRightButton(title:String = kBlankString) {
//        if title == kBlankString {
//            setRightButton(shouldHide: true, imageName: nil, title: title)
//        }else {
//            setRightButton(shouldHide: false, imageName: nil, title: title)
//        }
//    }
//
//    fileprivate func setRightButton(shouldHide:Bool = true, imageName:String? = nil, title:String) {
//        btnRight.isHidden = shouldHide
//        if shouldHide {
//            btnRight.setImage(nil, for: .normal)
//        }else if let name = imageName {
//            btnRight.setImage(UIImage(named: name), for: .normal)
//        }else {
//            btnRight.setTitle(title, for: .normal)
//        }
//    }
//
    
    @IBAction func actionSideMenu(_ sender: UIButton) {
        if let drawerController = navigationController?.parent as? KYDrawerController {
            drawerController.setDrawerState(.opened, animated: true)
        }
    }
    
    @IBAction func actionRightMenu(_ sender: Any) {
        delegate?.opneRightMenu()
    }
    @IBAction func actionRightButton(_ sender: Any) {
        delegate?.rightButtonAction()
    }
    
    @IBAction func actionShowSelectedOptionDetails(_ sender: UIButton) {
        delegate?.rightButtonOptionAction(tag : sender.tag)
    }
    
        
    //MARK:- FUNCTIONS
    func showHomeController()  {
        let storyBoard = UIStoryboard(name: StoryboardNames.Home, bundle: nil)
        var controller = BaseNavigationController()
        controller = storyBoard.instantiateViewController(withIdentifier: ControllerIdentifier.HomeBaseNavigationController) as! BaseNavigationController
        if let oldRef = self.baseNavigationController {
            oldRef.viewDidDisappear(true)
            oldRef.view.removeFromSuperview()
        }
        self.baseNavigationController = controller
        addChild(controller)
        controller.view.frame = self.viewContainer.bounds
        self.viewContainer.addSubview(controller.view)
        controller.didMove(toParent: self)
    }
    func showSettingsController()  {
           let storyBoard = UIStoryboard(name: StoryboardNames.Home, bundle: nil)
           var controller = BaseNavigationController()
           controller = storyBoard.instantiateViewController(withIdentifier: ControllerIdentifier.SettingsBaseNavigationController) as! BaseNavigationController
           if let oldRef = self.baseNavigationController {
               oldRef.viewDidDisappear(true)
               oldRef.view.removeFromSuperview()
           }
           self.baseNavigationController = controller
           addChild(controller)
           controller.view.frame = self.viewContainer.bounds
           self.viewContainer.addSubview(controller.view)
           controller.didMove(toParent: self)
       }
    
    func ShowProfile(){
        let storyBoard = UIStoryboard(name: StoryboardNames.Home    , bundle: nil)
        var controller = BaseNavigationController()
        controller = storyBoard.instantiateInitialViewController() as! BaseNavigationController
        if let oldRef = self.baseNavigationController {
            oldRef.viewDidDisappear(true)
            oldRef.view.removeFromSuperview()
        }
        self.baseNavigationController = controller
        addChild(controller)
        controller.view.frame = self.viewContainer.bounds
        self.viewContainer.addSubview(controller.view)
        controller.didMove(toParent: self)
        
    }
    
   
    
    func showProductsController()  {
        let storyBoard = UIStoryboard(name: "Details", bundle: nil)
        var controller = BaseNavigationController()
        controller = storyBoard.instantiateViewController(withIdentifier: "CategoriesVC") as! BaseNavigationController
        if let oldRef = self.baseNavigationController {
            oldRef.viewDidDisappear(true)
            oldRef.view.removeFromSuperview()
        }
        self.baseNavigationController = controller
        addChild(controller)
        controller.view.frame = self.viewContainer.bounds
        self.viewContainer.addSubview(controller.view)
        controller.didMove(toParent: self)
    }
    
    func showCategoriesController()  {
        let storyBoard = UIStoryboard(name: "Details", bundle: nil)
        var controller = BaseNavigationController()
        controller = storyBoard.instantiateViewController(withIdentifier: "CategoryVC") as! BaseNavigationController
        if let oldRef = self.baseNavigationController {
            oldRef.viewDidDisappear(true)
            oldRef.view.removeFromSuperview()
        }
        self.baseNavigationController = controller
        addChild(controller)
        controller.view.frame = self.viewContainer.bounds
        self.viewContainer.addSubview(controller.view)
        controller.didMove(toParent: self)
    }
    
    func showHelpController()  {
           let storyBoard = UIStoryboard(name: "Details", bundle: nil)
           var controller = BaseNavigationController()
           controller = storyBoard.instantiateViewController(withIdentifier: "HelpVC") as! BaseNavigationController
           if let oldRef = self.baseNavigationController {
               oldRef.viewDidDisappear(true)
               oldRef.view.removeFromSuperview()
           }
           self.baseNavigationController = controller
           addChild(controller)
           controller.view.frame = self.viewContainer.bounds
           self.viewContainer.addSubview(controller.view)
           controller.didMove(toParent: self)
       }
    
    func showOrderController()  {
           let storyBoard = UIStoryboard(name: "Main", bundle: nil)
           var controller = BaseNavigationController()
           controller = storyBoard.instantiateViewController(withIdentifier: "OrderVC") as! BaseNavigationController
           if let oldRef = self.baseNavigationController {
               oldRef.viewDidDisappear(true)
               oldRef.view.removeFromSuperview()
           }
           self.baseNavigationController = controller
           addChild(controller)
           controller.view.frame = self.viewContainer.bounds
           self.viewContainer.addSubview(controller.view)
        controller.didMove(toParent: self)
    }
    
    func logoutUser()  {
        Global.shared.user = nil
        Global.shared.isLogedIn = false
       UserDefaultsManager.shared.clearUserData()
        UserDefaultsManager.shared.clearToken()
             
        let storyboard = UIStoryboard(name: StoryboardNames.Registration, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.LoginViewController) as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionEditAndSave(_ sender: UIButton){
        Global.shared.drawerController = self.navigationController?.parent as? KYDrawerController
        if(DeviceType.IS_IPAD){
            Global.shared.drawerController?.drawerWidth = 500
        }
        Global.shared.drawerController!.setDrawerState(.opened, animated: true)
    }
    
    @IBAction func actionBack(_ sender: Any) {
        //self.navigationController?.popViewController(animated: true)
        delegate?.actionBack()
    }
}



