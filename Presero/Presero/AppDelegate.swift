//
//  AppDelegate.swift
//  Presero
//
//  Created by apple on 7/15/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
         IQKeyboardManager.shared.enable = true
      //  self.setInitialViewController()
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func setInitialViewController()  {
           
           let isLogin = UserDefaultsManager.shared.isUserLoggedIn
           Global.shared.isLogedIn = isLogin
           var vc: UIViewController!
           
           if(isLogin){
               Global.shared.user = UserDefaultsManager.shared.userInfo
              Global.shared.token = UserDefaultsManager.shared.token!
               let storyBoard = UIStoryboard(name: StoryboardNames.Main, bundle: nil)
               vc = storyBoard.instantiateViewController(withIdentifier: ControllerIdentifier.KYDrawerController) as! KYDrawerController
           }else {
               let storyBoard = UIStoryboard(name: StoryboardNames.Registration, bundle: nil)
                          vc = storyBoard.instantiateViewController(withIdentifier: ControllerIdentifier.LoginViewController) as! LoginViewController
           }
           let navigationController = BaseNavigationController(rootViewController: vc)
           navigationController.navigationBar.isHidden = true
           window?.rootViewController = navigationController
           window?.makeKeyAndVisible()
       }
}

