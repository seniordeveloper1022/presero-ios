//
//  PatientWoundDetailsTableViewCell.swift
//  Presero
//
//  Created by apple on 7/15/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class PatientWoundDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureView(title : String , detail : String){
        self.lblTitle.text = title
        self.lblDetails.text = detail
    }
//    func configureDetailsView(title : String , woundDetail : WoundDetailViewModel , scanDetails : ScanDetailsViewModel){
//        self.lblTitle.text = title
//      //  self.lblDetails.text = detail
//    }

}
