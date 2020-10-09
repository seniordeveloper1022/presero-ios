//
//  ManageOperatorTableViewCell.swift
//  Presero
//
//  Created by apple on 9/15/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ManageOperatorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgIsAdmin: UIImageView!
    @IBOutlet weak var imgSelect: UIImageView!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureView(operater : OperatorViewModel){
        self.lblUserName.text = operater.loginName
        self.lblFullName.text = operater.firstName + operater.lastName
        if(operater.isSelected){
            self.imgSelect.image = UIImage(named: "ch-box")
        }
        else{
            self.imgSelect.image = UIImage(named: "un-box")
        }
        if(operater.isAdmin){
            self.imgIsAdmin.isHidden = false
        }
        else{
            self.imgIsAdmin.isHidden = true
        }
    }
    
}
