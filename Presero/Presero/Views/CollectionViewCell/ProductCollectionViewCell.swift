//
//  ProductCollectionViewCell.swift
//  Tawrid
//
//  Created by Rizwan Ali on 15/01/2020.
//  Copyright © 2020 Rapidzz. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: BaseCollectionViewCell{
    
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    func configureView(catagory: CategoryViewModel){
        self.setImageWithUrl(imageView:  self.imgImage!, url: catagory.image)
        self.lblName.text = catagory.name
    }
}
