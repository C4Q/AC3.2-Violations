//
//  DetailViewController.swift
//  AC3.2-Violations
//
//  Created by Harichandan Singh on 10/16/16.
//  Copyright © 2016 Harichandan Singh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var violatingRestaurant: Violation?
    
    //MARK: - Outlets
    
    @IBOutlet weak var businessNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var inspectionDateLabel: UILabel!
    @IBOutlet weak var inspectionTypeLabel: UILabel!
    @IBOutlet weak var criticalFlagLabel: UILabel!
    @IBOutlet weak var violationCodeLabel: UILabel!
    @IBOutlet weak var violationDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        businessNameLabel.text = violatingRestaurant?.dba
        addressLabel.text = "Location: \(violatingRestaurant!.building) \(violatingRestaurant!.street), \(violatingRestaurant!.boro), \(violatingRestaurant!.zipcode)"
        inspectionDateLabel.text = "Date of Inspection: \(violatingRestaurant!.inspectionDate)"
        inspectionTypeLabel.text = violatingRestaurant?.inspectionType
        criticalFlagLabel.text = violatingRestaurant?.criticalFlag
        criticalFlagLabel.textColor = .red
        violationCodeLabel.text = "Violation Code: \(violatingRestaurant!.violationCode)"
        violationDescriptionTextView.text = violatingRestaurant?.violationDesc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
