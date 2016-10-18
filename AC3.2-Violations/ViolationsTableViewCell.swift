//
//  ViolationsTableViewCell.swift
//  AC3.2-Violations
//
//  Created by Eric Chang on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationsTableViewCell: UITableViewCell {
  
  @IBOutlet weak var dbaLabel: UILabel!
  @IBOutlet weak var violationCodeLabel: UILabel!

  
  var thisViolationCell: Violations?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupData()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func setupData() {
    guard let thisVC = thisViolationCell else { return }
    dbaLabel.text = thisVC.dba
    violationCodeLabel.text = thisVC.violationCode
  }
}
