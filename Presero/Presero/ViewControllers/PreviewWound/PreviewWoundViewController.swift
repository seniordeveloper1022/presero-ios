//
//  PreviewWoundViewController.swift
//  Presero
//
//  Created by apple on 7/16/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

protocol PreviewWoundViewControllerDelegate : class {
    func addImage(image : UIImage)
}

class PreviewWoundViewController: BaseViewController , TopBarDelegate{
    
    @IBOutlet weak var lblPreview: UILabel!
    @IBOutlet weak var lblEdit: UILabel!
    @IBOutlet weak var imgPreview: UIImageView!
    @IBOutlet weak var imgWound: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    weak var delegate : PreviewWoundViewControllerDelegate!
    var woundImage : UIImage?
    var isImagesAdded = true
    var isFromWoundDetails = false
    var userKey = ""
    var pateintData : PateintViewModel?
      var woundList = WoundListViewModel()
    var woundDetailData = [String]()
    var woundType = ""
    var woundId = ""
    var comments = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        
        
        if let image = self.woundImage{
            self.imgWound.image = image
            self.imgPreview.image = image
        }
        let params : ParamsAny = ["type" : "wound_listing" , "token" : Global.shared.token]
        self.getWounds(params: params)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let container = self.mainContainer {
            container.delegate = self
            container.setTitle(title: NavigationTitles.PreviewWound)
            container.setMenuButton(isBack: true)
        }
    }
    
    func configureView(){
        if(self.isImagesAdded){
            self.lblPreview.text = "Click To Preview"
            self.lblEdit.text = "Click To Edit"
        }
        else{
            self.lblPreview.text = "Add Wound Image"
            self.lblEdit.text = "Add Wound Image"
        }
        for _ in 0...8 {
            self.woundDetailData.append("N/A")
        }
    }
    
    func actionBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionPreview(_ sender: Any) {
        if(self.isImagesAdded){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.PreviewWoundImageViewController) as! PreviewWoundImageViewController
            // if let image = self.woundImage{
            vc.image = self.imgPreview.image
            // }
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            self.fetchCameraImage()
        }
        
    }
    @IBAction func actionEdit(_ sender: Any) {
        if(self.isImagesAdded){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.EditImageViewController) as! EditImageViewController
            vc.imageWound = self.imgWound.image
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            self.fetchCameraImage()
        }
        
        
    }
    //token:dsadas
    //wound: {
    // “UID”: “edf0f86c-5a5e-4cb4-953c-49f514f7ec3e”,
    //“IsDeleted”: false,
    // “WoundLocation”: “dfsdd”,
    // “WoundOcurrenceDate”: null,
    //  “WoundEntryDate”: “2019-12-09T02:13:47.3821762-08:00",
    // “TreatmentStartDate”: “2019-12-09T04:07:05.637751-08:00",
    // “WoundType”: 0,
    // “HealingPrediction”: null,
    // “HealingEnabled”: false,
    // “SentReports”: []
    //}
    //key:Data/1094/1055/Patients/12b02c7c-7c08-40a2-ad3e-d246366b912e
    //type:add_wound
    //image: file
    
    @IBAction func actionAccept(_ sender: Any) {
        if(self.isFromWoundDetails){
            if self.delegate != nil{
                if(self.isImagesAdded){
                    //  del.addImage(image: self.imgWound.image!)
                    let woundParams : ParamsAny = ["UID":self.pateintData!.id , "isDeleted" : false , "WoundLocation" : "", "WoundOcurrenceDate" : "" , "WoundEntryDate" : Date() , "TreatmentStartDate" : Date(), "WoundType" : self.woundId ,"HealingPrediction" : "" , "HealingEnabled" : false , "SentReports" : []]
                    let params: ParamsAny = ["token" : Global.shared.token , "wound" : woundParams , "key" : self.userKey, "type" : "add_wound"]
                    self.addWoundRequest(params: params, image: self.imgWound.image)
                    //self.navigationController?.popViewController(animated: true)
                }
                else{
                    self.showAlertView(message: "Please Add Wound Image")
                }
            }
            
        }
        else{
            if(self.isImagesAdded){
                              //  del.addImage(image: self.imgWound.image!)
                              let woundParams : ParamsAny = ["UID":self.pateintData!.id , "isDeleted" : false , "WoundLocation" : "", "WoundOcurrenceDate" : "" , "WoundEntryDate" : Date() , "TreatmentStartDate" : Date(), "WoundType" : self.woundId ,"HealingPrediction" : "" , "HealingEnabled" : false , "SentReports" : []]
                              let params: ParamsAny = ["token" : Global.shared.token , "wound" : woundParams , "key" : self.userKey, "type" : "add_wound"]
                              self.addWoundRequest(params: params, image: self.imgWound.image)
                              //self.navigationController?.popViewController(animated: true)
                          }
                          else{
                              self.showAlertView(message: "Please Add Wound Image")
                          }
        }
    }
    
    @IBAction func actionDelete(_ sender: Any) {
        self.isImagesAdded = false
        self.imgWound.image = UIImage(named: "no-image")
        self.imgPreview.image = UIImage(named: "no-image")
        self.configureView()
    }
    
    //MARK: - IMAGE PICKER DELGATE METHODS
    override func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.woundImage = image
        self.imgWound.image = image
        self.imgPreview.image = image
        self.isImagesAdded = true
        picker.dismiss(animated: true, completion: nil)
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


//MARK:- TableView Methods.
extension PreviewWoundViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 8){
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.PreviewWoundCommentTableViewCell, for: indexPath) as! PreviewWoundCommentTableViewCell
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.PatientWoundDetailsTableViewCell, for: indexPath) as! PatientWoundDetailsTableViewCell
            cell.configureView(title: WoundInfo.PreviewWoundTitle[indexPath.row], detail: self.woundDetailData[indexPath.row])
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 8){
            return 215
        }
        else{
            return 50
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
extension PreviewWoundViewController : EditImageViewControllerDelegate{
    func doneEditing(image: UIImage , imageData :ImageCroppedViewModel , isCrop : Bool) {
        self.imgWound.image = image
        if(isCrop){
            self.woundDetailData[0] = "\(imageData.height * imageData.width)"
            self.woundDetailData[1] = "\(imageData.height)"
            self.woundDetailData[2] = "\(imageData.width)"
            self.woundDetailData[3] = "\(imageData.height * imageData.width)"
            self.tableView.reloadData()
        }
        else{
            self.woundDetailData[0] = "\(image.size.height * image.size.width)"
            self.woundDetailData[1] = "\(image.size.height)"
            self.woundDetailData[2] = "\(image.size.width)"
            self.woundDetailData[3] = "\(image.size.height * image.size.width)"
            self.tableView.reloadData()
        }
        Global.shared.treatmentPlan.width = Double(self.woundDetailData[2])!
        Global.shared.treatmentPlan.length = Double(self.woundDetailData[1])!
        Global.shared.treatmentPlan.area = Double(self.woundDetailData[3])!
        Global.shared.treatmentPlan.realArea = Double(self.woundDetailData[3])!
        Global.shared.treatmentPlan.comments = self.comments
        
    }
}


extension PreviewWoundViewController{
    func addWoundRequest(params: ParamsAny , image : UIImage?){
        let image = self.imgWound.image?.jpegData(compressionQuality: 0.8)
        self.startActivity()
        GCD.async(.Background){
        PateintServices.shared().addWound(params: params, image: image) { (message, success) in
            GCD.async(.Main){
                self.stopActivity()
            if(success){
                if(self.isFromWoundDetails){
                    self.navigationController?.popViewController(animated: true)
                }
                else{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.WoundDraingeViewController) as! WoundDraingeViewController
                              self.navigationController?.pushViewController(vc, animated: true)
                }
            }
            else{
                
               }
             }
           }
        }
    }
}
extension PreviewWoundViewController{
    func getWounds(params : ParamsAny){
        self.startActivity()
        GCD.async(.Background){
        PateintServices.shared().getWoundData(params: params) { (message, success, woundList) in
            GCD.async(.Main){
                self.stopActivity()
            if(success){
                self.woundList = woundList!
                self.showSelectWoundType(list: self.woundList)
                self.alertView?.show()
                
            }
            else{
                self.showAlertView(message: message)
            }
            }
        }
        }
    }
}

extension PreviewWoundViewController{
    override func getWoundInfo(name: String, type: String, id: Int) {
        self.woundType = type
        self.woundId =  "\(id)"
         self.alertView?.close()
        
    }
    override func close() {
        self.alertView?.close()
    }
}

