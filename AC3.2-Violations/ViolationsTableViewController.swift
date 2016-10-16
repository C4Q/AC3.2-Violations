//
//  ViolationsTableViewController.swift
//  AC3.2-Violations
//
//  Created by Victor Zhong on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationsTableViewController: UITableViewController {
	
	var violations = [Violation]()
	
	/* I wanted to section off by businesses aka DBAs, so I went ahead and populated a dictionary of non-repeating DBA numbers, and sorted into an array to store section index values. I also wanted to sort the violations in each section by dates descending. */
	
	var uniqueDBA = [String:Any]()
	var sortedDBAs = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		loadData()
		
		for all in violations {
			uniqueDBA.updateValue(1, forKey: all.dba)
		}
		
		sortedDBAs = Array(uniqueDBA.keys).sorted()
	}
	
	// MARK: - Table view data source
	override func numberOfSections(in tableView: UITableView) -> Int {
		return sortedDBAs.count
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let incidents = violations.filter { (violation) -> Bool in
			violation.dba == sortedDBAs[section]
		}
		return incidents.count
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "vioID", for: indexPath) as! ViolationsTableViewCell

		let section = violations.filter { (violation) -> Bool in
			violation.dba == sortedDBAs[indexPath.section]
		}
		
		let filtered = section.sorted { $0.inspectionDate > $1.inspectionDate }
		
		let data = filtered[indexPath.row]
		
		cell.nameLabel.text = "Violation Code: \(data.violationCode)"
		cell.infoLabel.text = data.dateInMMDDYYYY(for: data.inspectionDate)
		return cell
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return sortedDBAs[section]
	}
	
	// MARK: - Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let tappedViolationsCell: ViolationsTableViewCell = sender as? ViolationsTableViewCell {
			if segue.identifier == "detailSegue" {
				let detailViewController: DetailViewController = segue.destination as! DetailViewController
				
				let cellIndexPath: IndexPath = self.tableView.indexPath(for: tappedViolationsCell)!
				
				let incident = violations.filter { (violation) -> Bool in
					violation.dba == sortedDBAs[cellIndexPath.section] }
				
				let filtered = incident.sorted { $0.inspectionDate > $1.inspectionDate }[cellIndexPath.row]
				
				// Pass the selected object to the new view controller.
				detailViewController.selectedIncident = filtered
				
				// Configure the Detail View's back button
				let backItem = UIBarButtonItem()
				backItem.title = "More Violations"
				navigationItem.backBarButtonItem = backItem
			}
		}
	}
	
	// MARK: - Setup Stuff
	// Parse through the JSON and append to dict
	func loadData() {
		guard let path = Bundle.main.path(forResource: "violations", ofType: "json"),
			let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options:  NSData.ReadingOptions.mappedIfSafe),
			let violationsJSON = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as? NSArray else {
				return
		}
		
		if let violations = violationsJSON as? [[String:Any]] {
			for violationDict in violations {
				if let violation = Violation(withDict: violationDict) {
					self.violations.append(violation)
				}
			}
		}
	}
}
