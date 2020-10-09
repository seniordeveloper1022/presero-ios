//
//  WoundDebridementViewController.swift
//  Presero
//
//  Created by apple on 7/16/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class WoundDebridementViewController: BaseViewController, TopBarDelegate {
    @IBOutlet weak var btnDebridementYes: UIButton!
    @IBOutlet weak var btnDebridementNo: UIButton!
    @IBOutlet weak var btnScan: UIButton!
    var woundImage:UIImage?
    var userKey = ""
    var pateintData : PateintViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.connfigureView()

        // Do any additional setup after loading the view.
    }
    
    func connfigureView(){
        self.btnScan.setTitleColor(UIColor.init(hexFromString: "757A80"), for: .normal)
        self.btnScan.isUserInteractionEnabled = false

    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          if let container = self.mainContainer {
              container.delegate = self
              container.setTitle(title: NavigationTitles.WoundDebridement)
              container.setMenuButton(isBack: true)
          }
      }
    
    @IBAction func actionDebridementYes(_ sender: UIButton) {
        self.btnDebridementYes.setTitleColor(.white, for: .normal)
        self.btnDebridementNo.setTitleColor(UIColor.init(hexFromString: "757A80"), for: .normal)

            self.btnDebridementNo.backgroundColor = UIColor.clear
        self.btnDebridementYes.backgroundColor = UIColor.init(hexFromString: "745CAB")
        self.btnScan.setTitleColor(.white, for: .normal)
        self.btnScan.isUserInteractionEnabled = true
        Global.shared.treatmentPlan.treatment.debridementNeeded = true
        
    }
    
    @IBAction func actionDebridementNo(_ sender: UIButton) {
        self.btnDebridementNo.setTitleColor(.white, for: .normal)
        self.btnDebridementYes.setTitleColor(UIColor.init(hexFromString: "757A80"), for: .normal)
        self.btnDebridementYes.backgroundColor = UIColor.clear
        self.btnDebridementNo.backgroundColor = UIColor.init(hexFromString: "745CAB")
        self.btnScan.setTitleColor(.white, for: .normal)
        self.btnScan.isUserInteractionEnabled = true
        Global.shared.treatmentPlan.treatment.debridementNeeded = false
    }
    
    @IBAction func actionSkipScan(_ sender: UIButton) {
      //  self.MoveToPreviewWoundVC()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.WoundDraingeViewController) as! WoundDraingeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionScan(_ sender: UIButton) {
        self.fetchCameraImage()
    }
    
    
    
    func actionBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func MoveToPreviewWoundVC(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.PreviewWoundViewController) as! PreviewWoundViewController
        vc.isImagesAdded = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           let image = info[UIImagePickerController.InfoKey.originalImage]as!UIImage
        self.woundImage = image
        let vc = self.storyboard?.instantiateViewController(withIdentifier: ControllerIdentifier.PreviewWoundViewController) as! PreviewWoundViewController
        vc.woundImage = self.woundImage
        vc.userKey = self.userKey
        vc.pateintData = self.pateintData
        self.navigationController?.pushViewController(vc, animated: true)
        picker.dismiss(animated: true, completion: nil)
        
       }
}
