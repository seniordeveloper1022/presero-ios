//
//  DrawerTableViewCell.swift
//  TawridSupplier
//
//  Created by apple on 2/7/20.
//  Copyright © 2020 Rizwan Ali. All rights reserved.
//

import UIKit

class DrawerTableViewCell: UITableViewCell {

    @IBOutlet weak var lblbottomLine: UILabel!

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgDrawerMenu: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureView(side:[String:String]) {
           self.imgDrawerMenu.image = UIImage(named: side["image"]!)
           self.lblTitle.text = side["title"]
           
       }

}
