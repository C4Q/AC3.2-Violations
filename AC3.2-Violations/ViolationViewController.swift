//
//  ViolationViewController.swift
//  AC3.2-Violations
//
//  Created by Annie Tung on 10/17/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationViewController: UIViewController {
    
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var action: UILabel!
    @IBOutlet weak var boro: UILabel!
    @IBOutlet weak var building: UILabel!
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var inspectionDate: UILabel!
    @IBOutlet weak var inspectionType: UILabel!
    @IBOutlet weak var violationCode: UILabel!
    
    var vio: Violation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
     }
    
    func setUpLabels(){
        guard let v = vio else { return }
            restaurantName.text = v.dba
            action.text = v.action
            boro.text = v.boro
            building.text = "Building #\(v.building)"
            grade.text = "Grade: \(v.grade)"
            inspectionDate.text = "Inspection Date: \(v.inspection_date)"
            inspectionType.text = "Inspection Type: \(v.inspection_type)"
            violationCode.text = "Violation Code: \(v.violation_code)"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
