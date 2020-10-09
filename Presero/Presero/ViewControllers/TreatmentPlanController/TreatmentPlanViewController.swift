//
//  TreatmentPlanViewController.swift
//  Presero
//
//  Created by apple on 7/15/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class TreatmentPlanViewController: BaseViewController , TopBarDelegate{
    
    @IBOutlet weak var dropDownTableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var lblBirthDate: UILabel!
    @IBOutlet weak var lblPateintId: UILabel!
    @IBOutlet weak var lblPtaientName: UILabel!
    @IBOutlet weak var lblWoundType: UILabel!
    var woundList = WoundListViewModel()
    var isDropDownOpen = false
    var pateintData : PateintViewModel!
    var woundName = ["Diabetic/neuropathy","Diabetic/neuropathy","Diabetic/neuropathy","pressure UIcer injury","Vescular leg","Vescular leg"]
    var woundsData = ["Diabetic/neuropathy","pressure UIcer/injury","Vescular leg"]
    var isSelected = [false,false,false,false,false,false]
    var userKey = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dropDownTableView.isHidden = true
        self.configureView()
        let params : ParamsAny = ["type" : "wound_listing" , "token" : Global.shared.token]
        self.getWounds(params: params)
        // Do any additional setup after loading the view.
    }
    
    func configureView(){
        self.lblPateintId.text = self.pateintData.patientId
        self.lblPtaientName.text = self.pateintData.patientName
        self.lblBirthDate.text = self.pateintData.birthDate
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let container = self.mainContainer {
            container.delegate = self
            container.setTitle(title: NavigationTitles.TreatmentPlan)
            container.setMenuButton(isBack: true)
        }
    }
    
    func actionBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionDropDown(_ sender: Any) {
        if(!isDropDownOpen){
            self.dropDownTableView.isHidden = false
            self.isDropDownOpen = true
        }
        else{
            self.dropDownTableView.isHidden = true
            self.isDropDownOpen = false
        }
    }
    
    
    @IBAction func actionNext(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.WoundDebridementViewController) as! WoundDebridementViewController
        vc.userKey = self.userKey
        vc.pateintData = self.pateintData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionCancle(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
}


//MARK:- CollectionView Methods

extension TreatmentPlanViewController : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.woundList.woundList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.WoundDetailsCollectionViewCell, for: indexPath) as! WoundDetailsCollectionViewCell
       // cell.lblImage.text = "Image#\(indexPath.row + 1)"
        if(self.woundList.woundList[indexPath.row].isSelected){
            cell.viewBackground.isHidden = false
            cell.lblWoundName.textColor =  UIColor.init(hexFromString: "F54B6A")
        }
        else{
            cell.lblWoundName.textColor = .white
            cell.viewBackground.isHidden = true
        }
        
        cell.lblWoundName.text = self.woundList.woundList[indexPath.row].name
        self.setImageWithUrl(imageView: cell.imgWound, url: self.woundList.woundList[indexPath.row].image, placeholderImage: "")
        
        
        
        // cell.selectionStyle = .none
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.size.width/3) - 5, height: collectionView.frame.size.height - 10)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
       // self.isSelected = isSelected.map { _ in false }
        for wound in self.woundList.woundList{
            wound.isSelected = false
        }
        self.woundList.woundList[indexPath.row].isSelected = true
        self.lblWoundType.text = self.woundList.woundList[indexPath.row].name
        self.collectionView.reloadData()
   
    }
}

extension TreatmentPlanViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.woundList.woundList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.InjuryTypeTableViewCell, for: indexPath) as! InjuryTypeTableViewCell
        cell.lblType.text  = self.woundList.woundList[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dropDownTableView.deselectRow(at: indexPath, animated: true)
        self.dropDownTableView.isHidden = true
        self.isDropDownOpen = false
        self.lblWoundType.text = self.woundList.woundList[indexPath.row].name
        for wound in self.woundList.woundList{
            wound.isSelected = false
        }
        self.woundList.woundList[indexPath.row].isSelected = true
        self.collectionView.reloadData()
    }

}

extension TreatmentPlanViewController{
    func getWounds(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
        PateintServices.shared().getWoundData(params: params) { (message, success, woundList) in
            GCD.async(.Main){
                self.stopActivity()
            if(success){
                self.woundList = woundList!
                self.dropDownTableView.reloadData()
                self.collectionView.reloadData()
                
            }
            else{
                self.showAlertView(message: message)
            }
            }
        }
        }
    }
}
