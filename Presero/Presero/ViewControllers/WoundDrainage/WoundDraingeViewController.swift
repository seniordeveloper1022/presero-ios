//
//  WoundDraingeViewController.swift
//  Presero
//
//  Created by apple on 7/16/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class WoundDraingeViewController: UIViewController, TopBarDelegate {
    @IBOutlet weak var BtnLow: UIButton!
    @IBOutlet weak var BtnModerate: UIButton!
    @IBOutlet weak var BtnHeigh: UIButton!
    @IBOutlet weak var btnfillerRequiredNo: UIButton!
    @IBOutlet weak var btnFillerRequiredYes: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    var isDraingeSelect = false
    var isFilterSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        // Do any additional setup after loading the view.
    }
    
    func configureView(){
        if(self.isDraingeSelect && self.isFilterSelected){
             self.btnNext.setTitleColor(.white, for: .normal)
            self.btnNext.isUserInteractionEnabled = true
        }
        else{
    self.btnNext.setTitleColor(UIColor.init(hexFromString: "757A80"), for: .normal)
          self.btnNext.isUserInteractionEnabled = false
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let container = self.mainContainer {
            container.delegate = self
            container.setTitle(title: NavigationTitles.WoundDrainage)
            container.setMenuButton(isBack: true)
        }
    }
    
    
    
    
    
    @IBAction func actionLow(_ sender: UIButton){
        self.isDraingeSelect = true
        self.configureView()
        self.clearBtnBackGroundColour()
        self.BtnLow.backgroundColor = UIColor.init(hexFromString: "745CAB")
            self.BtnLow.setTitleColor(.white, for: .normal)
        Global.shared.treatmentPlan.treatment.drainage = 1

    }
    
    @IBAction func actionModerate(_ sender: UIButton){
        self.isDraingeSelect = true
          self.configureView()
        self.clearBtnBackGroundColour()
        self.BtnModerate.backgroundColor = UIColor.init(hexFromString: "745CAB")
           self.BtnModerate.setTitleColor(.white, for: .normal)
         Global.shared.treatmentPlan.treatment.drainage = 2

    }
    
    @IBAction func actionHeigh(_ sender: UIButton){
        self.isDraingeSelect = true
        self.configureView()
        self.clearBtnBackGroundColour()
        self.BtnHeigh.backgroundColor = UIColor.init(hexFromString: "745CAB")
            self.BtnHeigh.setTitleColor(.white, for: .normal)
         Global.shared.treatmentPlan.treatment.drainage = 3

    }
    
    @IBAction func actionMoveBack(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionNext(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.WoundCharacteristicsViewController) as! WoundCharacteristicsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionFillerNo(_ sender: UIButton){
        self.isFilterSelected = true
          self.configureView()
        self.btnfillerRequiredNo.setTitleColor(.white, for: .normal)
        self.btnFillerRequiredYes.setTitleColor(UIColor.init(hexFromString: "757A80"), for: .normal)

         self.btnFillerRequiredYes.backgroundColor = UIColor.clear
         self.btnfillerRequiredNo.backgroundColor = UIColor.init(hexFromString: "745CAB")
         Global.shared.treatmentPlan.treatment.fillerNeeded = false
        
    }
    @IBAction func actionFillerYes(_ sender: UIButton){
        self.isFilterSelected = true
        self.configureView()
        self.btnFillerRequiredYes.setTitleColor(.white, for: .normal)
        self.btnfillerRequiredNo.setTitleColor(UIColor.init(hexFromString: "757A80"), for: .normal)

         self.btnfillerRequiredNo.backgroundColor = UIColor.clear
         self.btnFillerRequiredYes.backgroundColor = UIColor.init(hexFromString: "745CAB")
        Global.shared.treatmentPlan.treatment.fillerNeeded = true
    }
    
    func clearBtnBackGroundColour(){
        self.BtnLow.backgroundColor = UIColor.clear
        self.BtnHeigh.backgroundColor = UIColor.clear
        self.BtnModerate.backgroundColor = UIColor.clear
        self.BtnLow.setTitleColor(UIColor.init(hexFromString: "757A80"), for: .normal)
        self.BtnHeigh.setTitleColor(UIColor.init(hexFromString: "757A80"), for: .normal)
        self.BtnModerate.setTitleColor(UIColor.init(hexFromString: "757A80"), for: .normal)
        
       
    }
    func actionBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
