//
//  SelectCategoryTableViewCell.swift
//  TawridSupplier
//
//  Created by Gulfam Khan on 28/02/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import UIKit

class SelectCategoryTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var imgCheck: UIImageView!
    @IBOutlet weak var LblCategoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    func configure(with category:CategoryViewModel) {
        self.LblCategoryName.text = category.name
        self.setImageWithUrl(imageView: imgCheck, url: category.image, placeholder: AssetNames.iconSelectCategory)
    }
    
    
    
}
