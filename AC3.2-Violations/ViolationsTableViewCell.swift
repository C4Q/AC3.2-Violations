//
//  ViolationsTableViewCell.swift
//  AC3.2-Violations
//
//  Created by Victor Zhong on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationsTableViewCell: UITableViewCell {

	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var infoLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
