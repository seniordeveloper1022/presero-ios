//
//  AddCategoryTableViewCell.swift
//  TawridSupplier
//
//  Created by apple on 2/7/20.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import UIKit

class AddCategoryTableViewCell: BaseTableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageSelected: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgCategory: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureView(_ category:CategoryViewModel) {
        self.setImageWithUrl(imageView: imgCategory, url: category.image)
        self.lblName.text = category.name
        
    }

}
