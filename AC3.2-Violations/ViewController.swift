//
//  ViewController.swift
//  AC3.2-Violations
//
//  Created by Jason Gresh on 10/15/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var dbaLabel: UILabel!
  @IBOutlet weak var cuisineDescriptionLabel: UILabel!
  @IBOutlet weak var phoneLabel: UILabel!
  @IBOutlet weak var boroZipLabel: UILabel!
  @IBOutlet weak var streetBuildingLabel: UILabel!
  @IBOutlet weak var inspectionDateLabel: UILabel!
  @IBOutlet weak var gradeLabel: UILabel!
  @IBOutlet weak var inspectionTypeLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var violationCodeLabel: UILabel!
  @IBOutlet weak var criticalFlagLabel: UILabel!
  @IBOutlet weak var violationDescriptionTextView: UITextView!
  
  var thisViolation: Violations?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupData()
  }
  
  func setupData() {
    guard let v = thisViolation else { return }
    dbaLabel.text = v.dba
    cuisineDescriptionLabel.text = v.cuisineDescription
    phoneLabel.text = v.phone
    boroZipLabel.text = "\(v.boro), \(v.zipcode)"
    streetBuildingLabel.text = "\(v.street) - BUILDING \(v.building)"
    inspectionDateLabel.text = "Inspection Date: \n\t\(v.inspectionDate)"
    gradeLabel.text = "Grade: \(v.grade)"
    inspectionTypeLabel.text = "Inspection Type: \n\t\(v.inspectionType)"
    scoreLabel.text = "Score: \(v.score)"
    violationCodeLabel.text = "Violation Code: \(v.violationCode)"
    criticalFlagLabel.text = v.criticalFlag
    violationDescriptionTextView.text = v.violationDescription
  }
  
  
}

