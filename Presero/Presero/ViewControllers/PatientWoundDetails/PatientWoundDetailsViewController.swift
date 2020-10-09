//
//  PatientWoundDetailsViewController.swift
//  Presero
//
//  Created by apple on 7/15/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class PatientWoundDetailsViewController: BaseViewController, TopBarDelegate {
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblBirthDate: UILabel!
    @IBOutlet weak var lblPateintId: UILabel!
    @IBOutlet weak var lblPateintName: UILabel!
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var pateintData : PateintViewModel!
    var isForCamera = false
    var userKey = ""
    var bucketList : PateintBucketListViewModel?
    var filterWoundBucketList = [PateintBucketViewModel]()
    var filterScanBucketList = [PateintBucketViewModel]()
    var filterImageBucketList = [PateintBucketViewModel]()
    var woundDetails = WoundDetailViewModel()
    var scandetails = ScanDetailsViewModel()
    var woundDetailData = [String]()
    var completeWoundData = [CompleteWoundViewModel]()
    var image = Data()
    var selectedIndex = 0
    var isFirstTime = true
    var woundImage = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        
    }
    func configureView(){
        self.lblPateintId.text = self.pateintData.patientId
        self.lblPateintName.text = self.pateintData.patientName
        self.lblBirthDate.text = self.pateintData.birthDate
        self.userKey = "Data/\(pateintData.accountID)/\(pateintData.facility)/Patients/\(pateintData.id)"
        Global.shared.userKey = self.userKey
        self.woundDetailData.removeAll()
        for _ in 0...11 {
            self.woundDetailData.append("N/A")
        }
        for bucket in self.bucketList!.buketList{
            if(bucket.key.contains(self.userKey)){
                if(bucket.key.contains("Wound.json")){
                    self.filterWoundBucketList.append(bucket)
                }
                if(bucket.key.contains("Scan.json")){
                    self.filterScanBucketList.append(bucket)
                }
                if(bucket.key.contains("Scan.jpg")){
                    self.filterImageBucketList.append(bucket)
                }
            }
        }
        self.filterWoundBucketList =  self.filterWoundBucketList.sorted(by: {
            $0.lastModified.compare($1.lastModified) == .orderedDescending
        })
        self.filterScanBucketList =  self.filterScanBucketList.sorted(by: {
            $0.lastModified.compare($1.lastModified) == .orderedDescending
        })
        self.filterImageBucketList =  self.filterImageBucketList.sorted(by: {
            $0.lastModified.compare($1.lastModified) == .orderedDescending
        })
        if(self.filterScanBucketList.count > 0){
            Global.shared.treatmentPlan.dateTimeOfScan = self.filterScanBucketList[0].lastModified
        }
        else{
            Global.shared.treatmentPlan.dateTimeOfScan = ""
        }
        //        if(self.filterWoundBucketList.count > 0){
        //        let woundParams : ParamsAny = ["type" : "patient_detail" , "token" : Global.shared.token , "userKey" : self.filterWoundBucketList[0].key]
        //        self.pageControl.numberOfPages = self.filterImageBucketList.count
        //        self.getWoundDetails(params: woundParams)
        //        }
        //        if(self.filterImageBucketList.count > 0){
        //            let woundParams : ParamsAny = ["type" : "patient_detail" , "token" : Global.shared.token , "userKey" : self.filterWoundBucketList[0].key]
        //            self.pageControl.numberOfPages = self.filterImageBucketList.count
        //            self.getWoundDetails(params: woundParams)
        //        }
        if(self.filterImageBucketList.count > 0){
            let scanParams : ParamsAny = ["type" : "patient_detail" , "token" : Global.shared.token , "userKey" : self.filterImageBucketList[self.selectedIndex].key]
            self.pageControl.numberOfPages = self.filterImageBucketList.count
            self.getWoundImageDetails(params: scanParams)
        }
        
    }
    
    func configureEmptyWoundData(){
        self.woundDetailData.removeAll()
        for _ in 0...11 {
            self.woundDetailData.append("N/A")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.isForCamera = false
        if let container = self.mainContainer {
            container.delegate = self
            container.btnWoundDetails.tintColor = .white
            container.btnRightMenu.isHidden = false
            container.widthMenuButton.constant = 30
            // container.setImageBtnRight(setSearchImage: false, isHiddenImage: false , image: "dot")
            container.setTitle(title: NavigationTitles.PatientWound)
            container.setMenuButton(isBack: true)
            
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let container = self.mainContainer{
            container.btnWoundDetails.tintColor = UIColor.init(hexFromString: "7F7F7F")
            container.btnRightMenu.isHidden = true
            container.widthMenuButton.constant = 0
            //  container.setImageBtnRight(setSearchImage: false, isHiddenImage: true , image: "dot")
            container.viewOptionMenu.isHidden = true
        }
    }
    //    func rightButtonAction() {
    //        if let container = self.mainContainer{
    //
    //            if container.viewOptionMenu.isHidden{
    //                container.viewOptionMenu.isHidden = false
    //
    //            }else{
    //                container.viewOptionMenu.isHidden = true
    //            }
    //
    //        }
    //
    //    }
    
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
            let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.TreatmentPlanViewController) as! TreatmentPlanViewController
            vc.pateintData = self.pateintData
            vc.userKey = self.userKey
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if tag == 1{
            self.isForCamera =  true
            self.fetchCameraImage()
        }
        else if tag == 2{
            
        }
        else if tag == 3{
            
        }
        else{
            
        }
    }
    
    func actionBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionAddPhoto(_ sender: UIButton){
        self.fetchProfileImage()
    }
    
    //MARK: - IMAGE PICKER DELGATE METHODS
    override func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.imgImage.image = image
        picker.dismiss(animated: true, completion: nil)
        if(self.isForCamera){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.PreviewWoundViewController) as! PreviewWoundViewController
            vc.woundImage = image
            vc.isFromWoundDetails = true
            vc.pateintData = self.pateintData
            vc.userKey = self.userKey
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func configureWoundData(){
        self.woundDetailData[0] = "N/A"
        self.woundDetailData[1] = "N/A"
        self.woundDetailData[2] = self.scandetails.dateTimeOfScan
        self.woundDetailData[3] = (String(self.scandetails.area))
        self.woundDetailData[4] = (String(self.scandetails.length))
        self.woundDetailData[5] = (String(self.scandetails.width))
        self.woundDetailData[6] = (String(self.scandetails.realArea))
        self.woundDetailData[7] = (String(self.scandetails.maxDepth))
        self.woundDetailData[8] = (String(self.scandetails.presentationVolume))
        self.woundDetailData[9] = ("0%")
        self.woundDetailData[10] = ("0%")
        self.woundDetailData[11] = ("1")
    }
}

//MARK:- Extension TableView Methods:
extension PatientWoundDetailsViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.PatientWoundDetailsTableViewCell, for: indexPath) as! PatientWoundDetailsTableViewCell
        
        // cell.configureDetailsView(title: WoundInfo.WoundTitle[indexPath.row], woundDetail: self.woundDetails, scanDetails: self.scandetails)
        
        cell.configureView(title: WoundInfo.WoundTitle[indexPath.row], detail: self.woundDetailData[indexPath.row] )
        
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}

extension PatientWoundDetailsViewController : PreviewWoundViewControllerDelegate{
    func addImage(image: UIImage) {
        self.imgImage.image = image
    }
}

extension PatientWoundDetailsViewController{
    
    func getScanDetails(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            PateintServices.shared().getScanData(params: params) { (message, success, scanData) in
                GCD.async(.Main){
                    self.stopActivity()
                    if(success){
                        self.scandetails = scanData!
                        self.configureWoundData()
                        self.completeWoundData.append(CompleteWoundViewModel(image: self.image, woundDetails: self.woundDetailData))
                        self.tableView.reloadData()
                        if(self.isFirstTime){
                            self.collectionView.reloadData()
                            self.pageControl.currentPage = self.selectedIndex
                            self.isFirstTime = false
                        }
                    }
                    else{
                        self.showAlertView(message: message)
                    }
                }
            }
        }
    }
    func getWoundDetails(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            PateintServices.shared().getWoundDetailsData(params: params) { (message, success, woundDetails) in
                GCD.async(.Main){
                    self.stopActivity()
                    if(success){
                        self.woundDetails = woundDetails!
                        //                        if(self.filterScanBucketList.count > 0){
                        //                        let scanParams : ParamsAny = ["type" : "patient_detail" , "token" : Global.shared.token , "userKey" : self.filterScanBucketList[self.selectedIndex].key]
                        //                        self.getScanDetails(params: scanParams)
                        //                     }
                        //                        if(self.filterImageBucketList.count > 0){
                        //                            let scanParams : ParamsAny = ["type" : "patient_detail" , "token" : Global.shared.token , "userKey" : self.filterImageBucketList[self.selectedIndex].key]
                        //                            self.getWoundImageDetails(params: scanParams)
                        //                        }
                        if(self.filterScanBucketList.count > 0){
                            let scanParams : ParamsAny = ["type" : "patient_detail" , "token" : Global.shared.token , "userKey" : self.filterScanBucketList[self.selectedIndex].key]
                            self.getScanDetails(params: scanParams)
                        }
                    }
                    else{
                        self.showAlertView(message: message)
                    }
                }
            }
        }
        
    }
    func getWoundImageDetails(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
            PateintServices.shared().getWoundImageData(params: params) { (message, success, image) in
                GCD.async(.Main){
                    self.stopActivity()
                    if(success){
                        self.woundImage.append(image!)
                        self.collectionView.reloadItems(at: [IndexPath(item: self.selectedIndex, section: 0)])
                        if(self.filterWoundBucketList.count > 0){
                            let woundParams : ParamsAny = ["type" : "patient_detail" , "token" : Global.shared.token , "userKey" : self.filterWoundBucketList[0].key]
                            self.getWoundDetails(params: woundParams)
                        }
                        //                        if(self.filterScanBucketList.count > 0){
                        //                            let scanParams : ParamsAny = ["type" : "patient_detail" , "token" : Global.shared.token , "userKey" : self.filterScanBucketList[self.selectedIndex].key]
                        //                            self.getScanDetails(params: scanParams)
                        //                        }
                    }
                    else{
                        self.showAlertView(message: message)
                    }
                }
            }
        }
    }
}

extension PatientWoundDetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filterImageBucketList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.WoundCollectionViewCell, for: indexPath) as! WoundCollectionViewCell
        if(indexPath.row + 1 <= self.woundImage.count){
            cell.imgWound.image = self.woundImage[indexPath.row]
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.size.width), height: collectionView.frame.size.height)
        
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if(scrollView == self.collectionView){
            let x = targetContentOffset.pointee.x
            let item = Int(x / self.collectionView.frame.width)
            self.selectedIndex = item
            if(self.selectedIndex + 1 <= self.completeWoundData.count){
                self.pageControl.currentPage = self.selectedIndex
                self.woundDetailData = self.completeWoundData[selectedIndex].woundDetails
                self.tableView.reloadData()
            }
            else{
                self.pageControl.currentPage = selectedIndex
                if(selectedIndex + 1 > self.filterScanBucketList.count || selectedIndex + 1 > self.filterWoundBucketList.count){
                    self.pageControl.currentPage = self.selectedIndex
                    self.configureEmptyWoundData()
                    self.completeWoundData.append(CompleteWoundViewModel(image: self.image, woundDetails: self.woundDetailData))
                    self.tableView.reloadData()
                }
                else{
//                    let woundParams : ParamsAny = ["type" : "patient_detail" , "token" : Global.shared.token , "userKey" : self.filterWoundBucketList[selectedIndex].key ]
//                    self.getWoundDetails(params: woundParams)
               
                              let scanParams : ParamsAny = ["type" : "patient_detail" , "token" : Global.shared.token , "userKey" : self.filterImageBucketList[self.selectedIndex].key]
                              self.getWoundImageDetails(params: scanParams)
                          
                }
            }
        }
    }
}


