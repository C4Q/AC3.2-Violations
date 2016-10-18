//
//  ViewController.swift
//  AC3.2-Violations
//
//  Created by Jason Gresh on 10/15/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boroLabel: UILabel!
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var DBALabel: UILabel!
    @IBOutlet weak var violationDescriptionLabel: UILabel!
    @IBOutlet weak var criticalStatusView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var inspectionTypeLabel: UILabel!
    @IBOutlet weak var inspectionDateLabel: UILabel!
    
    var theViolations: Violations?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        criticalStatusView.layer.cornerRadius = 25
        criticalStatusView.layer.masksToBounds = true
            setupData()
    }

    func setupData() {
        if let violate = theViolations {
            boroLabel.text = "Borough: \(violate.boro)"
            scoreLabel.text = violate.score
            DBALabel.text = violate.name
            cuisineLabel.text = violate.cuisineDescription
            violationDescriptionLabel.text = violate.violationDescription
            inspectionDateLabel.text = violate.inspectionDate
            inspectionTypeLabel.text = violate.inspectionType
            if violate.criticalLevel == "Critical" {
                criticalStatusView.backgroundColor = .red
                scoreLabel.textColor = .white
            } else {
                criticalStatusView.backgroundColor = .yellow
                
            }
            
        }
    }
    
    @IBAction func scoreLabelTapped(_ sender: UITapGestureRecognizer) {
        if let violate = theViolations {
            if scoreLabel.text == violate.violationCode {
                scoreLabel.text = violate.score
            } else {
                scoreLabel.text = violate.violationCode
            }
        }
    }
    

}

