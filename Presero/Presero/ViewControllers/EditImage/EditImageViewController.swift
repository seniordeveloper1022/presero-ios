//
//  EditImageViewController.swift
//  Presero
//
//  Created by apple on 9/11/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
protocol EditImageViewControllerDelegate : class {
    func doneEditing(image : UIImage , imageData : ImageCroppedViewModel , isCrop : Bool)
}


class EditImageViewController: BaseViewController ,YPSignatureDelegate,TopBarDelegate{
  

    
    @IBOutlet weak var imgWound: ZImageCropperView!
    @IBOutlet weak var viewDraw: YPDrawSignatureView!
   // @IBOutlet weak var imgWound: UIImageView!
    @IBOutlet weak var viewWoundEdit : UIView!
    weak var delegate : EditImageViewControllerDelegate!
    var woundImageEdited : UIImage?
    var imageWound : UIImage?
    var isImageCropped = false
    var imageData : ImageCroppedViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgWound.image = self.imageWound
        //self.adjustSize()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         if let container = self.mainContainer {
             container.delegate = self
             container.setTitle(title: "Edit Wound")
             container.setMenuButton(isBack: true)
         }
     }
    
    
//    func adjustSize(){
//        self.viewWoundEdit.frame.size = CGSize(width: imgWound.frame.width, height: imgWound.frame.height)
//       // self.viewWoundEdit.frame.size = self.imageWound!.size
//      //  self.viewDraw.frame.size = self.imageWound!.size
//       // self.viewDraw.contentMode = .scaleToFill
//
//
//    }
    func actionBack() {
        self.navigationController?.popViewController(animated: true)
      }
      
    
    @IBAction func actionClear(_ sender: Any) {
       // self.viewDraw.clear()
       self.imgWound.resetCrop()
        self.imgWound.image = self.imageWound
        self.woundImageEdited = nil
    }
    
    @IBAction func actionDone(_ sender: Any) {
  // self.adjustSize()
       
        //self.viewDraw.frame.size = self.imageWound!.size
      
   // self.viewWoundEdit.frame.size = self.imageWound!.size
  //  self.imgWound.contentMode = .scaleToFill
   // self.viewDraw.contentMode = .scaleToFill
   //// self.woundImageEdited = self.viewWoundEdit.screenshot()
        let imageInfo = self.imgWound.cropImage()
        if(imageInfo.IsCrop){
        self.woundImageEdited = imageInfo.image
        }
        else{
            self.woundImageEdited = self.imageWound
        }
     //  self.woundImageEdited = self.imgWound.screenshot()
       // self.imgWound.image = self.woundImageEdited
        if let del = self.delegate{
            
             if(imageInfo.IsCrop){
                del.doneEditing(image : self.woundImageEdited!, imageData: imageInfo, isCrop: true)
            }
             else{
                del.doneEditing(image : self.woundImageEdited!, imageData: imageInfo, isCrop: false)
                
            }
          //  self.woundImageEdited = self.imgWound.image
          
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func didStart(_ view: YPDrawSignatureView) {
         // self.viewWoundEdit.frame.size = self.imageWound!.size
       // self.viewDraw.frame.size = self.imageWound!.size
             print("Start")
         }
         func didFinish(_ view: YPDrawSignatureView) {
             print("Finished Drawing")
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
