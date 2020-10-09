//
//  EditOperatorViewController.swift
//  Presero
//
//  Created by apple on 9/15/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EditOperatorViewController: BaseViewController , TopBarDelegate {
    
    @IBOutlet weak var txtfFirstName: UITextField!
    @IBOutlet weak var txtfMiddleName: UITextField!
    @IBOutlet weak var txtfLastName: UITextField!
    @IBOutlet weak var txtfUserName: UITextField!
    @IBOutlet weak var txtfEmail: UITextField!
    @IBOutlet weak var btnIsPrevileged: UIButton!
    var operater : OperatorViewModel?
    var isPrevileged = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
           if let container = self.mainContainer{
               container.delegate = self
               container.setMenuButton(isBack: true)
               container.setTitle(title: "Update Operator")
           }
       }
       func actionBack() {
           self.navigationController?.popViewController(animated: true)
       }
    
    
    func configureView(){
        self.txtfFirstName.text = operater?.firstName
        self.txtfMiddleName.text = operater?.middleName
        self.txtfLastName.text = operater?.lastName
        self.txtfUserName.text = operater?.loginName
        self.txtfEmail.text = operater?.email
        self.isPrevileged = operater?.isAdmin ?? false
        if(!self.isPrevileged){
            self.btnIsPrevileged.setImage(UIImage(named: "un-box"), for: .normal)
        }
        else{
            self.btnIsPrevileged.setImage(UIImage(named: "ch-box"), for: .normal)
        }
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
        else if(!Utilities.isValidEmail(self.txtfEmail.text ?? "")){
            self.showAlertView(message: "Invalid Email")
            isValid = false
        }
        return isValid
    }
    
    @IBAction func actionIsPreviledge(_ sender: Any) {
        if(self.isPrevileged){
            self.isPrevileged = !self.isPrevileged
            self.btnIsPrevileged.setImage(UIImage(named: "un-box"), for: .normal)
        }
        else{
            self.isPrevileged = !self.isPrevileged
            self.btnIsPrevileged.setImage(UIImage(named: "ch-box"), for: .normal)
        }
    }
    
    @IBAction func actionSave(_ sender: Any) {
        
        if(self.validation()){
            let params : ParamsAny  = ["id" : self.operater!.id ,
                                       "Deleted" : false ,
                                       "WindowsId" : "" ,
                                       "FirstName" : self.txtfFirstName.text! ,
                                       "MiddleName" : self.txtfMiddleName.text! ,
                                       "LastName" : self.txtfLastName.text! ,
                                       "LoginName" : self.txtfUserName.text! ,
                                       "Email" : self.txtfEmail.text! ,
                                       "EncryptedPassword" : operater!.encryptedPassword , "IsPersistent" : false ,
                                       "LastClientUpdate" : "25-09-2019" ,
                                       "IsAdmin" : self.isPrevileged ,
                                       "IsBuiltIn" : false ,
                                       "ShowTips" : false ,
                                       "PasswordLastChanged" : "2020-09-26",
                                       "token" : Global.shared.token ,
                                       "type" : "update_operator"]
            print(params)
            self.editOperator(params: params)
        }
    }
    @IBAction func actionReseetPassword(_ sender: Any) {
    }
    @IBAction func actionCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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

extension EditOperatorViewController{
    func editOperator(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            OperatorServices.shared().updateOperators(params: params) { (message, success) in
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
}

