//
//  ItemListTableViewCell.swift
//  Tawrid
//
//  Created by Rizwan Ali on 23/01/2020.
//  Copyright © 2020 Rapidzz. All rights reserved.
//

import UIKit

class ItemListTableViewCell: UITableViewCell {
    @IBOutlet weak var View: UIView!
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.View.dropShadow(radius: 2, opacity: 0.2)
        
    }
    func configureView(item: FruitsViewModel){
        self.imgImage.image = UIImage(named: item.image)
        self.lblName.text = item.name
    }
    
    
}
