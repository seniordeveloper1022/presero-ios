//
//  ZImageCropperView.swift
//  ZImageCropper
//
//  Created by Zaid Pathan on 25/05/19.
//  Copyright © 2019 Zaid Pathan. All rights reserved.
//

import UIKit

public class ZImageCropperView: UIImageView {

    //Update this to enable/disable cropping
    public var isCropEnabled = true

    //Update this for path line color
    public var strokeColor:UIColor = UIColor.black
    
    //Update this for path line width
    public var lineWidth:CGFloat = 2.0
    
    private var path = UIBezierPath()
    private var shapeLayer = CAShapeLayer()
    var imageData = ImageCroppedViewModel()
    
    //Get recently cropped image anytime
    var croppedImage: UIImage?
    
    var isLogEnabled = true
    var sizeHeight = [Int]()
    var sizeWidth = [Int]()
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        isUserInteractionEnabled = isCropEnabled
        
    }
    
    //MARK:- Public methods

    /**
     Crop selection layer
     
     - Returns: Cropped image
     */
    func cropImage() -> ImageCroppedViewModel {
        shapeLayer.fillColor = UIColor.black.cgColor
        layer.mask = shapeLayer
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 1)
        
        if let currentContext = UIGraphicsGetCurrentContext() {
            layer.render(in: currentContext)
            
            if let croppedImageFromContext = UIGraphicsGetImageFromCurrentImageContext() {
                UIGraphicsEndImageContext()
                croppedImage = croppedImageFromContext
            }
        }
        let minHeight = self.sizeHeight.min() ?? 0
        let maxHeight = self.sizeHeight.max() ?? 0
        let minWidth = self.sizeWidth.min() ?? 0
        let maxWidth = self.sizeWidth.max() ?? 0
        print(minHeight)
        print(maxHeight)
        print(minWidth)
        print(maxWidth)
        print(maxHeight - minHeight)
        print(maxWidth - minWidth)
        
        self.imageData.image = croppedImage!
        self.imageData.width = maxWidth - minWidth
        self.imageData.height = maxHeight - minHeight
        return imageData
    }
    

    
    /**
     Reset cropping
     */
    public func resetCrop() {
       // self.strokeColor = UIColor.clear
       // self.layer.removeFromSuperlayer()
       layer.sublayers?.removeAll()
        path = UIBezierPath()
        shapeLayer = CAShapeLayer()
       // shapeLayer.strokeColor = UIColor.clear.cgColor
        layer.mask = nil
        croppedImage = nil
        self.imageData.IsCrop = false
    }
    
    //MARK:- Private methods
    /**
     This methods is adding CAShapeLayer line to tempImageView
     */
    private func addNewPathToImage(){
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = lineWidth
        layer.addSublayer(shapeLayer)
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.location(in: self)
            if isLogEnabled {
                debugPrint("touch begin to : \(touchPoint)")
                 self.imageData.IsCrop = true
                self.sizeWidth.append(Int(touchPoint.y))
                self.sizeHeight.append(Int(touchPoint.x))
            }
            path.move(to: touchPoint)
        }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.location(in: self)
            if isLogEnabled {
                print("touch moved to : \(touchPoint)")
                self.sizeWidth.append(Int(touchPoint.y))
                               self.sizeHeight.append(Int(touchPoint.x))
            }
            path.addLine(to: touchPoint)
            addNewPathToImage()
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.location(in: self)
            if isLogEnabled {
                print("touch ended at : \(touchPoint)")
                self.sizeWidth.append(Int(touchPoint.y))
                self.sizeHeight.append(Int(touchPoint.x))
            }
            path.addLine(to: touchPoint)
            addNewPathToImage()
            path.close()
        }
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch?{
            let touchPoint = touch.location(in: self)
            if isLogEnabled {
                print("touch canceled at : \(touchPoint)")
            }
            path.close()
        }
    }
}
