//
//  WoundCharacteristicsViewController.swift
//  Presero
//
//  Created by apple on 7/16/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class WoundCharacteristicsViewController: BaseViewController , TopBarDelegate{
    
    @IBOutlet weak var viewCharc: UIStackView!
    @IBOutlet weak var lblTitleCharac: UILabel!
    @IBOutlet weak var heightViewCharctersitics: NSLayoutConstraint!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnRedness: UIButton!
    @IBOutlet weak var btnOdor: UIButton!
    @IBOutlet weak var btnTissue: UIButton!
    @IBOutlet weak var btnPain: UIButton!
    @IBOutlet weak var btnSignificent: UIButton!
    @IBOutlet weak var btnOther: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnLastVistNo: UIButton!
    @IBOutlet weak var btnLastVisitYes: UIButton!
    var characterSlectedCount = 0
    var isAntimicrobialSelected = false
    var isChangedSelected = false
    var isChanged = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.configureCharacView()
        
        // Do any additional setup after loading the view.
    }
    func configureView(){
        if(self.isAntimicrobialSelected && self.isChangedSelected){
            self.btnNext.setTitleColor(.white, for: .normal)
                      self.btnNext.isUserInteractionEnabled = true
        }
        else{
        self.btnNext.setTitleColor(UIColor.init(hexFromString: "757A80"), for: .normal)
                    self.btnNext.isUserInteractionEnabled = false
        }
    }
    
    func configureCharacView(){
        if(self.isChanged){
            self.viewCharc.isHidden = false
            self.lblTitleCharac.isHidden = false
            self.heightViewCharctersitics.constant = 200
            Global.shared.treatmentPlan.treatment.characteristicsChanged = characterSlectedCount
        }
        else{
             self.viewCharc.isHidden = true
            self.lblTitleCharac.isHidden = true
            self.heightViewCharctersitics.constant = 0
        Global.shared.treatmentPlan.treatment.characteristicsChanged = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let container = self.mainContainer {
            container.delegate = self
            container.setTitle(title: NavigationTitles.WoundCharacteristics)
            container.setMenuButton(isBack: true)
        }
    }
    @IBAction func actionRedness(_ sender: Any) {
       
        if self.btnRedness.isSelected{
            self.characterSlectedCount = self.characterSlectedCount - 1
            self.btnRedness.isSelected = false
        }else{
             if(self.characterSlectedCount < 4){
            self.characterSlectedCount = self.characterSlectedCount + 1
            self.btnRedness.isSelected = true
         
            }
            else{
                self.showAlertView(message: "You can only select maximum 4 characteristics")
                       }
        }
    Global.shared.treatmentPlan.treatment.characteristicsChanged = characterSlectedCount
    }
    @IBAction func actionOdor(_ sender: Any) {
        
        if self.btnOdor.isSelected{
            self.characterSlectedCount = self.characterSlectedCount - 1
            self.btnOdor.isSelected = false
        }else{
             if(self.characterSlectedCount < 4){
            self.characterSlectedCount = self.characterSlectedCount + 1
            self.btnOdor.isSelected = true
        }
            else{
                            self.showAlertView(message: "You can only select maximum 4 characteristics")
                       }
    }
        Global.shared.treatmentPlan.treatment.characteristicsChanged = characterSlectedCount
    }
    
    @IBAction func actionTissue(_ sender: Any) {
       
        if self.btnTissue.isSelected{
            self.characterSlectedCount = self.characterSlectedCount - 1
            self.btnTissue.isSelected = false
        }else{
             if(self.characterSlectedCount < 4){
            self.characterSlectedCount = self.characterSlectedCount + 1
            self.btnTissue.isSelected = true
        }
            else{
                           self.showAlertView(message: "You can only select maximum 4 characters")
                       }
    }
        Global.shared.treatmentPlan.treatment.characteristicsChanged = characterSlectedCount
    }
    @IBAction func actionPain(_ sender: Any) {
       
        if self.btnPain.isSelected{
            self.characterSlectedCount = self.characterSlectedCount - 1
            self.btnPain.isSelected = false
        }else{
             if(self.characterSlectedCount < 4){
            self.characterSlectedCount = self.characterSlectedCount + 1
            self.btnPain.isSelected = true
        }
             else{
                self.showAlertView(message: "You can only select maximum 4 characteristics")
            }
    }
        Global.shared.treatmentPlan.treatment.characteristicsChanged = characterSlectedCount
    }
    
    @IBAction func actionSignificent(_ sender: Any) {
        
        if self.btnSignificent.isSelected{
            self.characterSlectedCount = self.characterSlectedCount - 1
            self.btnSignificent.isSelected = false
        }else{
             if(self.characterSlectedCount < 4){
            self.characterSlectedCount = self.characterSlectedCount + 1
            self.btnSignificent.isSelected = true
        }
            else{
                             self.showAlertView(message: "You can only select maximum 4 characteristics")
                       }
    }
        Global.shared.treatmentPlan.treatment.characteristicsChanged = characterSlectedCount
    }
    
    @IBAction func actionOther(_ sender: Any) {
     
        if self.btnOther.isSelected{
            self.characterSlectedCount = self.characterSlectedCount - 1
            self.btnOther.isSelected = false
        }else{
             if(self.characterSlectedCount < 4){
            self.characterSlectedCount = self.characterSlectedCount + 1
            self.btnOther.isSelected = true
        }
            else{
                             self.showAlertView(message: "You can only select maximum 4 characteristics")
                       }
    }
        Global.shared.treatmentPlan.treatment.characteristicsChanged = characterSlectedCount
    }
    
    @IBAction func actionNo(_ sender: Any) {
        self.isAntimicrobialSelected = true
               self.configureView()
        self.btnNo.setTitleColor(.white, for: .normal)
              self.btnYes.setTitleColor(UIColor.init(hexFromString: "757A80"), for: .normal)
        self.btnYes.backgroundColor = UIColor.clear
        self.btnNo.backgroundColor = UIColor.init(hexFromString: "745CAB")
        Global.shared.treatmentPlan.treatment.antimicrobialNeeded = false
    }
    
    @IBAction func actionYes(_ sender: Any) {
        self.isAntimicrobialSelected = true
           self.configureView()
        self.btnYes.setTitleColor(.white, for: .normal)
              self.btnNo.setTitleColor(UIColor.init(hexFromString: "757A80"), for: .normal)
        self.btnNo.backgroundColor = UIColor.clear
        self.btnYes.backgroundColor = UIColor.init(hexFromString: "745CAB")
    Global.shared.treatmentPlan.treatment.antimicrobialNeeded = true
    }
    @IBAction func actionLastVisitNo(_ sender: Any) {
        self.isChanged = false
         self.configureCharacView()
        self.isChangedSelected = true
        self.configureView()
        self.btnLastVistNo.setTitleColor(.white, for: .normal)
              self.btnLastVisitYes.setTitleColor(UIColor.init(hexFromString: "757A80"), for: .normal)
        self.btnLastVisitYes.backgroundColor = UIColor.clear
        self.btnLastVistNo.backgroundColor = UIColor.init(hexFromString: "745CAB")
        Global.shared.treatmentPlan.treatment.haveCharacteristicsChanged = false

    }
    @IBAction func actionLastVisitYes(_ sender: Any) {
        self.isChanged = true
        self.configureCharacView()
        self.isChangedSelected = true
               self.configureView()
        self.btnLastVisitYes.setTitleColor(.white, for: .normal)
              self.btnLastVistNo.setTitleColor(UIColor.init(hexFromString: "757A80"), for: .normal)
        self.btnLastVistNo.backgroundColor = UIColor.clear
        self.btnLastVisitYes.backgroundColor = UIColor.init(hexFromString: "745CAB")
    Global.shared.treatmentPlan.treatment.haveCharacteristicsChanged = true
    }
    
    
    
    
    @IBAction func actionNext(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.TreatmentPlanDetailsViewController) as! TreatmentPlanDetailsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionBack(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    func actionBack() {
           self.navigationController?.popViewController(animated: true)
       }
    
    
}
