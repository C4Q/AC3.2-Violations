//
//  ViolationTableViewCell.swift
//  AC3.2-Violations
//
//  Created by Harichandan Singh on 10/16/16.
//  Copyright © 2016 Harichandan Singh. All rights reserved.
//

import UIKit

class ViolationTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
