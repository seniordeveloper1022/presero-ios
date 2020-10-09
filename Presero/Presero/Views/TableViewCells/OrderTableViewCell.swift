//
//  OrderTableViewCell.swift
//  TawridSupplier
//
//  Created by Rizwan Ali on 04/02/2020.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import UIKit

class OrderTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var lblOrderId: UILabel!
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblItemQuantity: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var lblSeeDetail: UILabel!
    @IBOutlet weak var view: UIView!
    
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.dropShadow(radius: 3, opacity: 0.1)
        self.lblSeeDetail.cornerRadius = 12
        self.lblSeeDetail.dropShadow(radius: 3, opacity: 0.2)
        self.view.dropShadow(radius: 2, opacity: 0.2)
        
    }
    
    func configure(with order:OrderViewModel) {
        lblName.text = order.name
        lblOrderId.text = "ID-\(order.orderId)"
        lblItemQuantity.text = "\(order.quantity)"
        lblTotalAmount.text = "\(order.amount)$"
        self.setImageWithUrl(imageView: self.imgImage, url: order.image, placeholder: AssetNames.OrderImage)
    }
    
    var clickHandler: (()->())?
    
    func watchForClickHandler(completion: @escaping ()-> Void) {
        self.clickHandler = completion
    }
    
    @IBAction func actionSeeDetail(_sender: UIButton){
        guard let completion = self.clickHandler else {return}
        completion()
    }

}
