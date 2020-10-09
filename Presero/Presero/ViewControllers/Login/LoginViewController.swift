//
//  LoginViewController.swift
//  Presero
//
//  Created by apple on 7/16/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    
    @IBOutlet weak var heightTableView: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtfName: UITextField!
    @IBOutlet weak var txtfPasword: UITextField!
    var operatorList = OperatorListViewModel()
    var isListOpen = false
    var isLogin = false
    var user : UserViewModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchToken()
        self.tableView.isHidden = true
        self.heightTableView.constant = 0
        
        
        // Do any additional setup after loading the view.
    }
    func fetchToken(){
        let params : ParamsAny = ["type":"login" , "preseroAppVersion" : "2.3.0", "deviceID":"2067","accountID" : "1094","facilityID" : "1055"]
        self.getToken(params: params)
    }
    
    @IBAction func actionOpenOperatorList(_ sender: Any) {
        if(!isListOpen){
            self.isListOpen = !isListOpen
            self.tableView.isHidden = false
            self.heightTableView.constant = 330
        }
        else{
            self.isListOpen = !isListOpen
            self.tableView.isHidden = true
            self.heightTableView.constant = 0
        }
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        if(self.txtfName.text == kBlankString){
            self.showAlertView(message: "Please Select Name")
        }
        else if(self.txtfPasword.text == kBlankString){
            self.showAlertView(message: "Please Enter Password")
        }
        else{
            let params : ParamsAny = ["type" : "encrypt_password" , "password" : self.txtfPasword.text!]
            self.getEncryptedPassword(params: params)
        }
    }
    
}
extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

extension LoginViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.operatorList.operatorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.OperatorTableViewCell, for: indexPath) as! OperatorTableViewCell
        cell.lblName.text = self.operatorList.operatorList[indexPath.row].loginName
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.txtfName.text = self.operatorList.operatorList[indexPath.row].loginName
        self.tableView.isHidden = true
        self.heightTableView.constant = 0
    }
    
    
}

extension LoginViewController{
    func getToken(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            LoginService.shared().getToken(params: params) { (message, success, token) in
                GCD.async(.Main){
                    self.stopActivity()
                    if(success){
                        Global.shared.token = token
                        //UserDefaultsManager.shared.token = token
                        let params : ParamsAny = ["type" : "operator_list" , "token" : token]
                        self.getOperators(params: params)
                    }
                    else{
                        self.showAlertView(message: message)
                    }
                }
            }
        }
    }
    func getOperators(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            LoginService.shared().getOperators(params: params) { (message, success, operatorList) in
                GCD.async(.Main){
                    self.stopActivity()
                    if(success){
                        self.operatorList = operatorList!
                        Global.shared.operatorList = operatorList!
                        self.tableView.reloadData()
                    }
                    else{
                        self.showAlertView(message: message)
                    }
                }
            }
        }
    }
    func getEncryptedPassword(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            LoginService.shared().getEncrptedPassword(params: params) { (message, success, password) in
                GCD.async(.Main){
                    self.stopActivity()
                    if(success){
                        for operatr in self.operatorList.operatorList{
                            if(self.txtfName.text == operatr.loginName && password == operatr.encryptedPassword){
                                self.isLogin = true
                                Global.shared.user = UserViewModel(operatr)
                                
                                break;
                                
                            }
                        }
                        if(self.isLogin){
                            let storyBoard = UIStoryboard(name: StoryboardNames.Main, bundle: nil)
                            let vc = storyBoard.instantiateViewController(withIdentifier: ControllerIdentifier.KYDrawerController) as! KYDrawerController
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                        else{
                            self.showAlertView(message: "Wrong Password")
                        }
                    }
                    else{
                        self.showAlertView(message: message)
                    }
                }
            }
        }
    }
}
