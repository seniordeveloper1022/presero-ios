//
//  ViewController.swift
//  Presero
//
//  Created by apple on 7/15/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
class ViewController: UIViewController{

    
    @IBOutlet weak var imageView: ZImageCropperView!
    var croppedImage: UIImage?
    var orignalImage : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.orignalImage = self.imageView.image

        // Do any additional setup after loading the view.
    }
   

    @IBAction func actionReset(_ sender: Any) {
        self.imageView.image =  self.orignalImage
        self.imageView.resetCrop()
        croppedImage = nil
    }
    @IBAction func actionCrop(_ sender: Any) {
    //  self.croppedImage = imageView.cropImage()
        self.imageView.image = self.croppedImage
        
    }
    
}

