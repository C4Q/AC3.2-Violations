//
//  ViolationsDetails.swift
//  AC3.2-Violations
//
//  Created by Marcel Chaucer on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationsDetails: UIViewController {
    var  detailViolation: Violations?
    
    @IBOutlet weak var violationDescription: UITextView!
    @IBOutlet weak var gradeImage: UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let detail = detailViolation {
            self.title = detail.dba
            self.violationDescription.text = "Code \(detail.violationCode): \(detail.violationDescription)"
            switch detail.grade {
            case "A":
                gradeImage.image = #imageLiteral(resourceName: "sanitary-inspection-grade")
            case "B":
                gradeImage.image = #imageLiteral(resourceName: "Grade-Card_B_v2")
            case "C":
                gradeImage.image = #imageLiteral(resourceName: "grade-card_c")
            case "Z":
                gradeImage.image = #imageLiteral(resourceName: "Screen-Shot-2013-09-16-at-12.21.55-PM1-e1379351326492")
            case nil:
                gradeImage.image = #imageLiteral(resourceName: "Screen-Shot-2013-09-16-at-12.21.55-PM1-e1379351326492")
            default:
                break
            }
            
        }
        }
    }


