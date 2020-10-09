//
//  PatientTableViewCell.swift
//  Presero
//
//  Created by apple on 7/15/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class PatientTableViewCell: BaseTableViewCell {

    @IBOutlet weak var viewSelection: UIView!
    @IBOutlet weak var lblOperatorName: UILabel!
    @IBOutlet weak var lblLastScan: UILabel!
    @IBOutlet weak var lblDateOfBirth: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblNameTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
