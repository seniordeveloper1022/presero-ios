//
//  ProductImageCollectionViewCell.swift
//  TawridSupplier
//
//  Created by Gulfam Khan on 27/02/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import UIKit

class ProductImageCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var imgProductImage: UIImageView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgProductImage.image = nil
    }
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    func configure(with url:String) {
        self.setImageWithUrl(imageView: self.imgProductImage, url: url)
    }
    
}
