//
//  SideMenuTableViewCell.swift
//  Presero
//
//  Created by Rizwan Ali on 27/07/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: BaseTableViewCell {

    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(index: Int){
        if index == 0{
            self.imgImage.image = UIImage(named: AssetNames.Home)
            self.lblTitle.text = "Home"
            
        }else if index == 1{
            self.imgImage.image = UIImage(named: AssetNames.Profile)
            self.lblTitle.text = "Settings"
            
        }else if index == 2{
            self.imgImage.image = UIImage(named: AssetNames.Help)
            self.lblTitle.text = "FAQ,s"
            
        }else if index == 3{
            self.imgImage.image = UIImage(named: AssetNames.Profile)
            self.lblTitle.text = "Privacy"
            
        }
        
    }

}
