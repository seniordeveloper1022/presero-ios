//
//  AddOperatorViewController.swift
//  Presero
//
//  Created by apple on 9/15/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class AddOperatorViewController: BaseViewController ,TopBarDelegate{
    
    @IBOutlet weak var txtfFirstName: UITextField!
    @IBOutlet weak var txtfMiddleName: UITextField!
    @IBOutlet weak var txtfLastName: UITextField!
    @IBOutlet weak var txtfUserName: UITextField!
    @IBOutlet weak var txtfPassword: UITextField!
    @IBOutlet weak var txtfEmail: UITextField!
    @IBOutlet weak var btnIsPrevileged: UIButton!
    var encryptedPassword = ""
    var isPrevileged = false
    var currentDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtfFirstName.becomeFirstResponder()
        self.currentDate = Utilities.getCurrentDate()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let container = self.mainContainer{
            container.delegate = self
            container.setMenuButton(isBack: true)
            container.setTitle(title: "Add Operator")
        }
    }
    func actionBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func validation() -> Bool{
        var isValid = true
        if(self.txtfFirstName.text == kBlankString){
            self.showAlertView(message: "Empty First Name")
            isValid = false
        }
        else if(self.txtfMiddleName.text == kBlankString){
            self.showAlertView(message: "Empty Middle Name")
            isValid = false
        }
        else if(self.txtfLastName.text == kBlankString){
            self.showAlertView(message: "Empty Lasr Name")
            isValid = false
        }
        else if(self.txtfUserName.text == kBlankString){
            self.showAlertView(message: "Empty Username")
            isValid = false
        }
        else if(self.txtfPassword.text == kBlankString){
            self.showAlertView(message: "Empty Password")
            isValid = false
        }
        else if(!Utilities.isValidEmail(self.txtfEmail.text ?? "")){
            self.showAlertView(message: "Invalid Email")
            isValid = false
        }
        return isValid
    }
    
    @IBAction func actionIsPrevileged(_ sender: Any) {
        if(self.isPrevileged){
            self.isPrevileged = !self.isPrevileged
            self.btnIsPrevileged.setImage(UIImage(named: "un-box"), for: .normal)
        }
        else{
            self.isPrevileged = !self.isPrevileged
            self.btnIsPrevileged.setImage(UIImage(named: "ch-box"), for: .normal)
        }
    }
    @IBAction func actionCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSave(_ sender: Any) {
        if(self.validation()){
            let params : ParamsAny = ["type" : "encrypt_password" , "password" : self.txtfPassword.text!]
            self.encrpyptPassword(params : params)
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension AddOperatorViewController{
    func addOperator(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            OperatorServices.shared().addOperators(params: params) { (message, success) in
                GCD.async(.Main){
                    self.stopActivity()
                    if(success){
                        self.showAlertView(message: message, title: "", doneButtonTitle: "OK") { (action) in
                            self.navigationController?.popViewController(animated: true)
                        }
                    }
                    else{
                        self.showAlertView(message: message)
                    }
                }
            }
        }
    }
    func encrpyptPassword(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            LoginService.shared().getEncrptedPassword(params: params) { (message, success, pass) in
                GCD.async(.Main){
                    self.stopActivity()
                    if(success){
                        self.encryptedPassword = pass
                        let params : ParamsAny = ["Deleted" : false ,
                                                  "WindowsId" : "" ,
                                                  "FirstName" : self.txtfFirstName.text! ,"MiddleName" : self.txtfMiddleName.text! ,
                                                  "LastName" : self.txtfLastName.text! , "LoginName" : self.txtfUserName.text! , "Email" : self.txtfEmail.text! , "EncryptedPassword" : self.encryptedPassword , "IsPersistent" : false , "LastClientUpdate" : Date() , "IsAdmin" : self.isPrevileged , "IsBuiltIn" : false ,
                                                  "ShowTips" : false , "PasswordLastChanged" :  self.currentDate,
                                                  "token" : Global.shared.token ,
                                                  "type" : "add_operator"]

                        print(params)
                        self.addOperator(params: params)
                    }
                    else{
                        self.showAlertView(message: message)
                    }
                }
            }
        }
    }
}
