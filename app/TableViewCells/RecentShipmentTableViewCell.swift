//
//  RecentShipmentTableViewCell.swift
//  app
//
//  Created by Kiran on 13/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit

class RecentShipmentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var documentNumberLabel:UILabel!
    @IBOutlet weak var loadingLabel:UILabel!
    @IBOutlet weak var dischargeLabel:UILabel!
    @IBOutlet weak var vesselNameLabel:UILabel!
    @IBOutlet weak var jobTypeLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
