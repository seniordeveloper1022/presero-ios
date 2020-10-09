//
//  AllPatientsViewController.swift
//  Presero
//
//  Created by apple on 7/15/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import SwiftyJSON
import Realm
import RealmSwift

class AllPatientsViewController: BaseViewController ,TopBarDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAll: UIButton!
    @IBOutlet weak var btnActive: UIButton!
    @IBOutlet weak var lblPateintCount: UILabel!
    
    var name : String?
    var isSearching = false
    var isDataFound = false
    //var dataArray = ["Sam Flanders" , "Joe Franc" , "Denial Serry","Steve Hamin" ,"Smith White", "Stably Stin" , "john Snow"]
    var isFromSearch = false
    var searchData  = [PateintViewModel]()
    var pateintList  = PateintListViewModel()
    var activePateint = [PateintViewModel]()
    var allPateint = [PateintViewModel]()
    var bucketList = PateintBucketListViewModel()
    var pateint : PateintViewModel?
    
    
    
    // var selectedIndex = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getPateints()
        // self.ReadPateintData()
        mainContainer?.txtfSearch.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        self.lblPateintCount.text = "\(self.pateintList.pateintList.count)"
        // Do any additional setup after loading the view.
    }
    func getPateints(){
        let params : ParamsAny = ["type" : "patient_list" , "token" : Global.shared.token]
        self.getAllPateint(params: params)
    }
    func ReadPateintData(){
        if let path = Bundle.main.path(forResource: "pateintData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSON(data: data)
                let pateintData = jsonObj["data"]["pateint"]
                self.pateintList = PateintListViewModel(list: pateintData)
                self.tableView.reloadData()
                print("jsonData:\(jsonObj)")
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    func configureView(){
        self.btnAll.backgroundColor = UIColor.clear
        self.btnActive.backgroundColor = UIColor.init(hexFromString: "F14D6B")
        self.isFromSearch = false
        self.pateintList.pateintList = self.activePateint
        self.tableView.reloadData()
        self.lblPateintCount.text = "\(self.pateintList.pateintList.count)"
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let container = self.mainContainer{
            //            if(self.selectedIndex != -1){
            //                container.btnPateintDetails.tintColor = .white
            //                container.btnPateintDetails.isUserInteractionEnabled = true
            //                   }
            //            else{
            //                container.btnPateintDetails.isUserInteractionEnabled = false
            //            }
            container.delegate = self
            container.btnMenu.isHidden = false
            //  container.btnRightMenu.isHidden = false
            container.btnRightMenu.isHidden = true
            container.widthMenuButton.constant = 0
            
            
        }
        self.mainContainer?.setTitle(title: "All Patient")
        self.mainContainer?.setMenuButton()
        self.mainContainer?.viewOptionMenu.isHidden = true
        if(self.isSearching){
            self.mainContainer?.viewSearch.isHidden = false
            self.mainContainer?.titleLabel.isHidden = true
            self.mainContainer?.setImageBtnRight(setSearchImage: true, isHiddenImage: false , image: "cut")
        }
        else{
            self.mainContainer?.titleLabel.isHidden = false
            self.mainContainer?.viewSearch.isHidden = true
            self.mainContainer?.setImageBtnRight(setSearchImage: true, isHiddenImage: false , image: "search-icon")
        }
        
        //self.mainContainer?.setRightButton(imageName: "search-icon")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let container = self.mainContainer{
            container.btnPateintDetails.tintColor = UIColor.init(hexFromString: "7F7F7F")
            container.setImageBtnRight(setSearchImage: false, isHiddenImage: true , image: "search-icon")
            container.viewSearch.isHidden = true
            container.titleLabel.isHidden = false
            container.btnRight.isHidden = true
            container.txtfSearch.endEditing(true)
        }
    }
    @IBAction func actionAll(_ sender: UIButton){
        self.btnActive.backgroundColor = UIColor.clear
        self.btnAll.backgroundColor = UIColor.init(hexFromString: "F14D6B")
        self.isFromSearch = false
        self.pateintList.pateintList = self.allPateint
        self.tableView.reloadData()
        self.lblPateintCount.text = "\(self.pateintList.pateintList.count)"
        
    }
    
    @IBAction func actionActive(_ sender: UIButton){
        self.btnAll.backgroundColor = UIColor.clear
        self.btnActive.backgroundColor = UIColor.init(hexFromString: "F14D6B")
        self.isFromSearch = false
        self.pateintList.pateintList = self.activePateint
        self.tableView.reloadData()
        self.lblPateintCount.text = "\(self.pateintList.pateintList.count)"
    }
    
    @IBAction func actionPlus(_ sender: UIButton){
        let storyboard = UIStoryboard(name: StoryboardNames.Patient, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.AddPatientViewController) as! AddPatientViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func actionBack() {
        
    }
    
    func opneRightMenu() {
        if let container = self.mainContainer{
            
            if container.viewOptionMenu.isHidden{
                container.viewOptionMenu.isHidden = false
                
            }else{
                container.viewOptionMenu.isHidden = true
            }
        }
    }
    
    func rightButtonOptionAction(tag: Int) {
        if(tag == 0){
            
        }
        else if tag == 1{
            
        }
        else if tag == 2{
            
        }
        else if tag == 3{
            //            if(self.selectedIndex == -1){
            //
            //            }
            //            else{
            //
            //                let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.PatientWoundDetailsViewController) as! PatientWoundDetailsViewController
            //                if(isDataFound){
            //                    vc.pateintData = self.searchData[self.selectedIndex]
            //                }
            //                else{
            //
            //                    vc.pateintData = self.pateintList.pateintList[self.selectedIndex]
            //                }
            //                self.navigationController?.pushViewController(vc, animated: true)
            //            }
        }
    }
    
    func rightButtonAction() {
        if let container = self.mainContainer{
            if(!isSearching){
                container.setImageBtnRight(setSearchImage: false, isHiddenImage: false , image: "cut")
                self.isFromSearch = true
                self.isDataFound = false
                //container.txtfSearch.delegate = self
                container.titleLabel.isHidden = true
                container.viewSearch.isHidden = false
                self.isSearching = true
            }
            else{
                container.setImageBtnRight(setSearchImage: false, isHiddenImage: false , image: "search-icon")
                self.isFromSearch = false
                self.isSearching = false
                self.isDataFound = false
                container.titleLabel.isHidden = false
                container.viewSearch.isHidden = true
                container.txtfSearch.endEditing(true)
                container.txtfSearch.text?.removeAll()
                self.tableView.reloadData()
                self.lblPateintCount.text = "\(self.pateintList.pateintList.count)"
            }
        }
    }
    func realmBucket(bucketData : PateintBucketViewModel) -> BucketRealmViewModel{
        let bucket = BucketRealmViewModel()
        bucket.eTag = bucketData.eTag
        bucket.size = bucketData.size
        bucket.lastModified = bucketData.lastModified
        bucket.key = bucketData.key
        bucket.storageClass = bucketData.storageClass
        return bucket
    }
    func pateintBucket(bucketData : BucketRealmViewModel) -> PateintBucketViewModel{
        let bucket = PateintBucketViewModel()
        bucket.eTag = bucketData.eTag
        bucket.size = bucketData.size
        bucket.lastModified = bucketData.lastModified
        bucket.key = bucketData.key
        bucket.storageClass = bucketData.storageClass
        return bucket
    }
    
    
    
    
    
    func deletePatient(index : Int){
        if(self.checkInternetConnection()){
            if(self.isDataFound){
                self.pateint =  self.searchData[index]
            }
            else if(!isFromSearch){
                self.pateint = self.pateintList.pateintList[index]
            }
            
            let params: ParamsAny = [
                DictKeys.PatientName: self.pateint!.patientName,
                DictKeys.PatientLastName: self.pateint!.patientLastName,
                DictKeys.AdmissionDate: self.pateint!.admissionDate,
                DictKeys.BirthDate: self.pateint!.birthDate,
                DictKeys.OperatorId: Global.shared.user.id,
                DictKeys.OperatorName: Global.shared.user.loginName,
                DictKeys.PatientId: self.pateint!.patientId,
                DictKeys.token: Global.shared.token,
                DictKeys.type: DictKeys.updatePatient,
                DictKeys.id : self.pateint!.id,
                DictKeys.deleted : true
                
            ]
            
            self.requestToDeletePatient(params: params)
        }
    }
    
    
    
}

//MARK:- TableView Method

extension AllPatientsViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.isDataFound){
            return self.searchData.count
        }
        else if(!isFromSearch){
            return self.pateintList.pateintList.count
        }
        else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.PatientTableViewCell, for: indexPath) as! PatientTableViewCell
        cell.selectionStyle = .none
        //        if(indexPath.row == self.selectedIndex){
        //            cell.viewSelection.backgroundColor = UIColor.init(hexFromString: "F14D6B")
        //        }
        //        else{
        //            cell.viewSelection.backgroundColor = UIColor.init(hexFromString: "1F2731")
        //        }
        if(self.isDataFound){
            cell.lblName.text =  self.searchData[indexPath.row].patientName
            cell.lblLastScan.text =  self.searchData[indexPath.row].lastScanDate
            cell.lblDateOfBirth.text = self.searchData[indexPath.row].birthDate
            cell.lblId.text =  self.searchData[indexPath.row].patientId
            cell.lblOperatorName.text =  self.searchData[indexPath.row].operatorName
        }
        else{
            cell.lblName.text  = self.pateintList.pateintList[indexPath.row].patientName
            cell.lblLastScan.text = self.pateintList.pateintList[indexPath.row].lastScanDate
            cell.lblDateOfBirth.text = self.pateintList.pateintList[indexPath.row].birthDate
            cell.lblId.text = self.pateintList.pateintList[indexPath.row].patientId
            cell.lblOperatorName.text = self.pateintList.pateintList[indexPath.row].operatorName
            
        }
        if(indexPath.row % 2 == 0){
            cell.lblNameTitle.textColor = UIColor.init(hexFromString: "8165BE")
            
        }
        else{
            cell.lblNameTitle.textColor = UIColor.init(hexFromString: "F14D6B")
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.PatientWoundDetailsViewController) as! PatientWoundDetailsViewController
        if(isDataFound){
            vc.pateintData = self.searchData[indexPath.row]
             Global.shared.selectPateint = self.searchData[indexPath.row]
        }
        else{
            
            vc.pateintData = self.pateintList.pateintList[indexPath.row]
             Global.shared.selectPateint = self.pateintList.pateintList[indexPath.row]
        }
        vc.bucketList = self.bucketList
       
        self.navigationController?.pushViewController(vc, animated: true)
        // self.selectedIndex = indexPath.row
        // self.mainContainer?.btnPateintDetails.isUserInteractionEnabled = true
        //  self.mainContainer?.btnPateintDetails.tintColor = .white
        //  self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let size = tableView.cellForRow(at: indexPath)!.frame.size.height
        let backView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: size))
        let myImage = UIImageView(frame: CGRect(x: 20, y: 65, width: 30, height: 30))
        myImage.contentMode = .scaleAspectFit
        myImage.image = UIImage(named: "delete-icon")
        backView.addSubview(myImage)
        //        myImage.translatesAutoresizingMaskIntoConstraints = false
        //        myImage.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        //        myImage.centerYAnchor.constraint(equalTo: backView.centerYAnchor).isActive = true
        //
        
        let imgSize: CGSize = tableView.frame.size
        UIGraphicsBeginImageContextWithOptions(imgSize, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        backView.layer.render(in: context!)
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let delete = UITableViewRowAction(style: .normal, title: "") { (action, indexPath) in
            print("Delete")
            self.deletePatient(index: indexPath.row)
        }
        
        delete.backgroundColor = UIColor(patternImage: newImage)
        
        let backView1 = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: size))
        
        let myImage1 = UIImageView(frame: CGRect(x: 20, y: 65, width: 30, height: 30))
        myImage1.image = UIImage(named: "Edit")
        myImage1.contentMode = .scaleAspectFit
        myImage1.tintColor = .white
        backView1.addSubview(myImage1)
        myImage1.translatesAutoresizingMaskIntoConstraints = false
        myImage1.centerXAnchor.constraint(equalTo: backView1.centerXAnchor).isActive = true
        myImage1.centerYAnchor.constraint(equalTo: backView1.centerYAnchor).isActive = true
        
        let imgSize1: CGSize = tableView.frame.size
        UIGraphicsBeginImageContextWithOptions(imgSize1, false, UIScreen.main.scale)
        let context1 = UIGraphicsGetCurrentContext()
        backView1.layer.render(in: context1!)
        let newImage1: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let Edit = UITableViewRowAction(style: .destructive, title: "") { (action, indexPath) in
            let storyboard = UIStoryboard.init(name: "Patient", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.AddPatientViewController) as! AddPatientViewController
            vc.isForEditPatient =  true
            if(self.isDataFound){
                vc.patientData =  self.searchData[indexPath.row]
            }
            else if(!self.isFromSearch){
                vc.patientData = self.pateintList.pateintList[indexPath.row]
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        Edit.backgroundColor = UIColor(patternImage: newImage1)
        return [delete,Edit]
    }
    
}
extension AllPatientsViewController{
    
    @objc func textFieldDidChange(textField: UITextField){
        if let container = self.mainContainer{
            if textField == container.txtfSearch{
                if(container.txtfSearch.text == kBlankString){
                    self.isFromSearch = false
                    self.isDataFound = false
                    self.tableView.reloadData()
                    self.lblPateintCount.text = "\(self.pateintList.pateintList.count)"
                }
                else{
                    self.isFromSearch = true
                    let filterdItemsArray = self.pateintList.pateintList.filter({ $0.patientName.lowercased().contains(container.txtfSearch.text!.lowercased())})
                    print(filterdItemsArray)
                    if(filterdItemsArray.count > 0){
                        self.isDataFound = true
                        self.searchData = filterdItemsArray
                        self.tableView.reloadData()
                        self.lblPateintCount.text = "\(self.searchData.count)"
                    }
                    else{
                        self.lblPateintCount.text = "\(filterdItemsArray.count)"
                        self.isDataFound = false
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}

extension AllPatientsViewController{
    func getAllPateint(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            PateintServices.shared().getPateints(params: params) { (message, success, pateintList) in
                GCD.async(.Main){
                    self.stopActivity()
                    if(success){
                        self.pateintList = pateintList!
                        self.allPateint = pateintList!.pateintList
                        self.lblPateintCount.text = "\(pateintList!.pateintList.count)"
                        for pateint in pateintList!.pateintList{
                            if(pateint.isActive){
                                self.activePateint.append(pateint)
                            }
                        }
                        self.configureView()
                        let params : ParamsAny = ["type" : "get_bucket_data"]
                        self.getBuketData(params: params)
                        //self.tableView.reloadData()
                    }
                    else{
                        self.showAlertView(message: message)
                    }
                    
                }
                
            }
        }
    }
    
    func getBuketData(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            PateintServices.shared().getPateintBucketData(params: params) { (message, success, buketList) in
                GCD.async(.Main){
                    self.stopActivity()
                    if(success){
                        self.bucketList = buketList!
                        if(self.bucketList.buketList.count > 0){
                            RealmOperations.shared().clearDatabase { (message, success) in
                                if(success){
                                    for bucket in self.bucketList.buketList{
                                        let bucketData = self.realmBucket(bucketData: bucket)
                                        RealmOperations.shared().addObject(bucketData, isUpdate: false) { (message, success) in
                                            if(success){
                                                print(message)
                                            }
                                        }
                                    }
                                }
                            }
                            
                        }
                        else{
                            RealmOperations.shared().getAllObjects(ofType: BucketRealmViewModel.self) { (message, sucess, bucketList) in
                                self.bucketList.buketList.removeAll()
                                if let list = bucketList{
                                    for bucket in list{
                                        self.bucketList.buketList.append(self.pateintBucket(bucketData: bucket))
                                    }
                                    
                                }
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
extension AllPatientsViewController{
    func requestToDeletePatient(params : ParamsAny){
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
