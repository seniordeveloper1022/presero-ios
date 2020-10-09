//
//  TreatmentPlanDetailsViewController.swift
//  Presero
//
//  Created by apple on 7/16/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class TreatmentPlanDetailsViewController: BaseViewController , TopBarDelegate{
    let treatmentPlan = ["Antimicrobial debridement agent","Heavy drainage pad","Gauze roll","Filler: Gauze roll"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let container = self.mainContainer {
            container.delegate = self
            container.setTitle(title: NavigationTitles.TreatmentPlan)
            container.setMenuButton(isBack: true)
        }
    }
    
    @IBAction func actionMoveBack(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionFinish(_ sender: Any) {
        self.treatSumbitRequest()
      
    }
    func treatSumbitRequest(){
        let treatment = Global.shared.treatmentPlan.treatment
        let treatmentObject = Global.shared.treatmentPlan
        let treatmentParams : ParamsAny = ["AntimicrobialNeeded" : treatment.antimicrobialNeeded,"FillerNeeded" : treatment.fillerNeeded,"Drainage" : treatment.drainage,"Size" : 4,"HaveCharacteristicsChanged" : treatment.haveCharacteristicsChanged,"DebridementNeeded" : "","CharacteristicsChanged" : treatment.characteristicsChanged]
        let treatmentObjectParams : ParamsAny = ["Treatment" : treatmentParams ,  "IsDeleted": false,
                                                 "UID": Global.shared.selectPateint?.patientId,
                                                 "PresentationVolume": 155.04979657718678,
                                                 "Circumference": 33.080834138476931,
                                                 "MaxDepth": 3.6062923927726858,
                                                 "BodyAngle": 0.0,
                                                 "Width": treatmentObject.width,
                                                 "Length": treatmentObject.length,
                                                 "CalibrationFactor": 0.96791736282302043,
                                                 "Area": treatmentObject.area,
                                                 "RealArea":treatmentObject.realArea,
                                                 "DateTimeOfScan": treatmentObject.dateTimeOfScan,
                                                 "OperatorId": Global.shared.user.accountId,
                                                 "Comments": treatmentObject.comments,
                                                 "DeviceID": "2067",
                                                 "RemarksText": [],
                                                 "RemarksRulers": [],
                                                 "EditSizeWidth": 0.0,
                                                 "EditSizeHeight": 0.0,
                                                 "OperatorName": Global.shared.user.loginName,
                                                 "ProjectionMatrix": [
            ],
                                                 "ViewModelMatrix": [
            ],
                                                 "UserMarking": [
            ],
                                                 "AutoPoints": [
            ]]
        let params : ParamsAny = ["type" : "add_treatment" ,"treatment_data" : treatmentObjectParams , "key" : "" , "token" : Global.shared.token ]
        self.addTreatmentRequest(params: params)
    }
    
    
    
}


//MARK:- TableView Methods

extension TreatmentPlanDetailsViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.treatmentPlan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.TreatmentPlanDetailsTableViewCell, for: indexPath) as! TreatmentPlanDetailsTableViewCell
        cell.lblPlanCount.text = "\(indexPath.row + 1)"
        if(indexPath.row == 10){
            cell.lblSeprator.isHidden = true
        }
        else{
            cell.lblSeprator.isHidden = false
        }
        cell.lblTreatmentPlan.text = self.treatmentPlan[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}


extension TreatmentPlanDetailsViewController{
    
    func addTreatmentRequest(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            OperatorServices.shared().addTreatment(params: params) { (message, success) in
                GCD.async(.Main){
                    self.stopActivity()
                    if(success){
                        for controller in self.navigationController!.viewControllers as Array {
                                  if controller.isKind(of: PatientWoundDetailsViewController.self) {
                                self.navigationController!.popToViewController(controller, animated: true)
                                      break
                                  }
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
