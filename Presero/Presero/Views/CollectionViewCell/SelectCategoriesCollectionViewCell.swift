//
//  SelectCategoriesCollectionViewCell.swift
//  TawridSupplier
//
//  Created by Rizwan Ali on 06/02/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import UIKit

class SelectCategoriesCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var imgIsSelected: UIImageView!
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var disabledView: UIView!
    @IBOutlet weak var lblIsActive: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    func configure(with product:ProductViewModel) {
        self.dropShadow(radius: 2, opacity: 0.1)
        self.lblTitle.text = product.name
        
        if product.supplierActive  == 1 {
            self.disabledView.isHidden = true
        }else {
            self.disabledView.isHidden = false
        }
        
        if product.images.count > 0 {
            self.setImageWithUrl(imageView: self.imgImage, url: product.images[0])
        }else {
            self.imgImage.image = UIImage(named: AssetNames.apple)
        }
    }
    
}
