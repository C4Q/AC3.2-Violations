//
//  DetailViewController.swift
//  AC3.2-Violations
//
//  Created by Victor Zhong on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	internal var selectedIncident: Violation!
	
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var addressLabel: UILabel!
	@IBOutlet weak var cuisineTypeLabel: UILabel!
	
	@IBOutlet weak var inspectionDateLabel: UILabel!
	@IBOutlet weak var inspectionTypeLabel: UILabel!
	
	@IBOutlet weak var violationCodeLabel: UILabel!
	@IBOutlet weak var violationSummaryLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		loadData(for: selectedIncident)
	}
	
	func loadData(for incident: Violation) {
		self.nameLabel.text = incident.dba
		self.addressLabel.text = incident.address
		
		// Brute forcing some annoying text errors
		let newCuisuine = incident.cuisine.replacingOccurrences(of: "Ã©", with: "é", options: .regularExpression, range: nil)
		self.cuisineTypeLabel.text = "Cuisine Type: \(newCuisuine)"
		
		self.inspectionDateLabel.text = "Inspection Date: \(incident.dateInMMDDYYYY(for: incident.inspectionDate))"
		self.inspectionTypeLabel.text = "Inspection Type: \(incident.inspectionType)"
		
		self.violationCodeLabel.text = "Violation Code: \(incident.violationCode) -- \(incident.criticalFlag)"
		if incident.criticalFlag == "Critical" {
			self.violationCodeLabel.textColor = .red
		}
		
		// Brute forcing some annoying text errors
		let newSum = incident.violationDesc.replacingOccurrences(of: "Â", with: "", options: .regularExpression, range: nil)
		let newSum1 = newSum.replacingOccurrences(of: "''''", with: "", options: .regularExpression, range: nil)
		self.violationSummaryLabel.text = newSum1
	}
}
