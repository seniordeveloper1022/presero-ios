//
//  PreviewWoundImageViewController.swift
//  Presero
//
//  Created by apple on 9/14/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class PreviewWoundImageViewController: BaseViewController , UIScrollViewDelegate ,TopBarDelegate {
   

    @IBOutlet weak var imgWound: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var image : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        if let image = self.image{
            self.imgWound.image = image
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
               super.viewWillAppear(animated)
               if let container = self.mainContainer {
                   container.delegate = self
                   container.setTitle(title: "Preview Wound")
                   container.setMenuButton(isBack: true)
               }
           }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imgWound
    }
    func actionBack() {
           self.navigationController?.popViewController(animated: true)
       }
       
    
    @IBAction func actionDone(_ sender: Any) {
        
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
