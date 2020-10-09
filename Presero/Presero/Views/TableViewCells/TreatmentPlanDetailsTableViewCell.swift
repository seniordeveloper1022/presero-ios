//
//  TreatmentPlanDetailsTableViewCell.swift
//  Presero
//
//  Created by apple on 7/16/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class TreatmentPlanDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTreatmentPlan: UILabel!
    @IBOutlet weak var lblPlanCount: UILabel!
    @IBOutlet weak var lblSeprator: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
