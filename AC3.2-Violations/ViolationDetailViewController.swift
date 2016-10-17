//
//  violationDetailViewController.swift
//  AC3.2-Violations
//
//  Created by Ana Ma on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationDetailViewController: UIViewController {
    var violation: Violation?
    
    @IBOutlet weak var DBALabel: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var boroLabel: UILabel!
    @IBOutlet weak var buildingLabel: UILabel!
    @IBOutlet weak var camisLabel: UILabel!
    @IBOutlet weak var critical_flagLabel: UILabel!
    @IBOutlet weak var cuisine_descriptionLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var grade_dateLabel: UILabel!
    @IBOutlet weak var inspection_dateLabel: UILabel!
    @IBOutlet weak var inspection_typeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var record_dateLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var violation_codeLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var violation_descriptionTextView: UITextView!
    /*
    {
        "action": "Violations were cited in the following area(s).",
        "boro": "QUEENS",
        "building": "4277",
        "camis": "50038414",
        "critical_flag": "Not Critical",
        "cuisine_description": "Caf\u00c3\u00a9/Coffee/Tea",
        "dba": "ETTO EXPRESSO BAR",
        "grade": "A",
        "grade_date": "2016-01-06T00:00:00.000",
        "inspection_date": "2016-01-06T00:00:00.000",
        "inspection_type": "Cycle Inspection / Initial Inspection",
        "phone": "7187864320",
        "record_date": "2016-10-15T06:04:14.000",
        "score": "10",
        "street": "HUNTER ST",
        "violation_code": "10F",
        "violation_description": "Non-food contact surface improperly constructed. Unacceptable material used. Non-food contact surface or equipment improperly maintained and/or not properly sealed, raised, spaced or movable to allow accessibility for cleaning on all sides, above and underneath the unit.",
        "zipcode": "11101"
    }
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpData() {
        guard let vio = violation else {return}
        DBALabel.text = vio.dba
        cuisine_descriptionLabel.text = "Cuisine Description: \(vio.cuisine_description)"
        critical_flagLabel.text = vio.critical_flag
        gradeLabel.text = "Grade \(vio.grade)"
        grade_dateLabel.text = "Grade Date: \(vio.grade_date)"
        record_dateLabel.text = "Record Date: \(vio.record_date)"
        inspection_dateLabel.text = "Inspection Date: \(vio.inspection_date)"
        inspection_typeLabel.text = "Inspection Type: \(vio.inspection_type)"
        actionLabel.text = "Action: \(vio.action)"
        camisLabel.text = "Camis: \(vio.camis)"
        phoneLabel.text = "Phone: \(vio.phone)"
        buildingLabel.text = "Building: \(vio.building)"
        boroLabel.text = "Boro: \(vio.boro)"
        streetLabel.text = "Street: \(vio.street)"
        zipcodeLabel.text = "Zip Code: \(vio.zipcode)"
        violation_codeLabel.text = "Violation Code \(vio.violation_code)"
        scoreLabel.text = "Score \(vio.score)"
        violation_descriptionTextView.text = "Violation Description \(vio.violation_description)"
        
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
