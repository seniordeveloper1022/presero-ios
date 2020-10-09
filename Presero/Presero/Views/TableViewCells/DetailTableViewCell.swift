//
//  DetailTableViewCell.swift
//  TawridSupplier
//
//  Created by Rizwan Ali on 04/02/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import UIKit

class DetailTableViewCell: BaseTableViewCell {
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var view: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.view.dropShadow(radius: 3, opacity: 0.1)
    }
    
    func configure(with orderItem:OrderProductsViewModel) {
        lblName.text = orderItem.name
        lblQuantity.text = "\(orderItem.quantity) \(orderItem.type)"
        lblTotalAmount.text = "\(orderItem.price)AED"
        self.setImageWithUrl(imageView: self.imgImage, url: orderItem.image, placeholder: AssetNames.OrderImage)
    }
    
}
