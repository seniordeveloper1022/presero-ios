//
//  AddPatientViewController.swift
//  Presero
//
//  Created by Rapidzz Macbook on 15/09/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import IQDropDownTextField

class AddPatientViewController: BaseViewController, TopBarDelegate {

    @IBOutlet weak var viewSwitch: UIView?
    @IBOutlet weak var txtFirstName: UITextField?
    @IBOutlet weak var txtLastName: UITextField?
    @IBOutlet weak var txtDOB: IQDropDownTextField?
    @IBOutlet weak var txtPatientID: UITextField?
    @IBOutlet weak var btnActive: UISwitch?
    var currentDate = ""
    var isForEditPatient = false
    var patientData : PateintViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentDate =  Utilities.getCurrentDate()
        self.txtDOB?.dropDownMode = .datePicker
        self.txtPatientID?.text = Utilities.getPatientId()
        self.txtFirstName?.becomeFirstResponder()
        self.configureView()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let container = self.mainContainer {
            container.delegate = self
            container.btnWoundDetails.tintColor = .white
            container.setTitle(title: NavigationTitles.AddPatient)
            container.setMenuButton(isBack: true)
           
        }
    }
    func configureView(){
        if(self.isForEditPatient){
            self.viewSwitch?.isHidden = false
            self.txtFirstName?.text = self.patientData?.patientName
            self.txtLastName?.text = self.patientData?.patientLastName
            self.txtDOB?.setSelectedItem(self.patientData?.birthDate, animated: false)
            self.txtPatientID?.text = self.patientData?.patientId
            if(self.patientData!.isActive){
                self.btnActive?.isOn = true
            }
            else{
                self.btnActive?.isOn = false
            }
        }
        else{
           self.viewSwitch?.isHidden = true
        }
    }
    func actionBack() {
        self.navigationController?.popViewController(animated: true)
    }
    func checkValidation() -> Bool {
        if(self.txtFirstName!.text!.isEmpty || self.txtLastName!.text!.isEmpty || self.txtDOB!.selectedItem!.isEmpty || self.txtPatientID!.text!.isEmpty){
            self.showAlertVIew(message: ValidationMessages.fillAllFields , title: "")
            return false
        }
        return true
    }
    
    
    @IBAction func actionActive(_ sender: UISwitch){
        if(sender.isOn){
            sender.isOn = true
        }else{
            sender.isOn = false
        }
    }
    
   
   
    @IBAction func actionSave(_ sender: UIButton){
        if(isForEditPatient){
             let params: ParamsAny = [
                            DictKeys.PatientName: self.txtFirstName!.text!,
                            DictKeys.PatientLastName: self.txtLastName!.text!,
                            DictKeys.AdmissionDate: self.currentDate,
                            DictKeys.OperatorId: Global.shared.user.id,
                            DictKeys.OperatorName: Global.shared.user.loginName,
                            DictKeys.PatientId: self.patientData!.patientId,
                            DictKeys.token: Global.shared.token,
                            DictKeys.type: DictKeys.updatePatient,"id" : self.patientData!.id
                        ]
                        self.requestToAddPatient(params: params)
        }
        else{
        if(self.checkValidation()){
        if(self.checkInternetConnection()){
            let params: ParamsAny = [
                DictKeys.PatientName: self.txtFirstName!.text!,
                DictKeys.PatientLastName: self.txtLastName!.text!,
                DictKeys.AdmissionDate: self.currentDate,
                DictKeys.BirthDate: self.txtDOB!.selectedItem!,
                DictKeys.OperatorId: Global.shared.user.id,
                DictKeys.OperatorName: Global.shared.user.loginName,
                DictKeys.PatientId: self.txtPatientID!.text!,
                DictKeys.token: Global.shared.token,
                DictKeys.type: DictKeys.addPatient
                
            ]
//            let encoder = JSONEncoder()
//            encoder.outputFormatting = .prettyPrinted
//            let data = try! encoder.encode(params)
            
//            let Parameeter = [
//                DictKeys.token: Global.shared.token,
//                DictKeys.type: DictKeys.addPatient,
//                DictKeys.NewPatient: params
//                ] as [String : Any]
            self.requestToAddPatient(params: params)
        }
        }
        }
    }
    @IBAction func actionCancel(_ sender: UIButton){
        self.actionBack()
       }
   

}
extension AddPatientViewController{
    func requestToAddPatient(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            PateintServices.shared().addPatient(params: params) { (message, success, response) in
                GCD.async(.Main){
                    self.stopActivity()
                    if(success){
                       self.showAlertView(message: message)
                    }
                    else{
                        self.showAlertView(message: message)
                    }
                }
            }
        }
    }
   
}
