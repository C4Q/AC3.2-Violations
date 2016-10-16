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
	
	enum Critical: Int {
		case critical
		case notCritical
		case notApplicable
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		loadData()
		dump(violations)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		guard let critical = Critical.init(rawValue: section), let data = byCrit(critical)
			else {
				return 0
		}
		return data.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vioID", for: indexPath) as! ViolationsTableViewCell

        // Configure the cell...
	
//		let section = episodes.filter { (episode) -> Bool in
//			return (episode.season - 1 ) == indexPath.section
//		}
		
		guard let critical = Critical.init(rawValue: indexPath.section), let data = byCrit(critical) else { return cell }
		cell.nameLabel.text = data[indexPath.row].dba
		cell.infoLabel.text = data[indexPath.row].criticalFlag
		return cell
    }
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		guard let critical = Critical.init(rawValue: section) else { return "" }
		switch critical {
		case .critical:
			return "Critical"
		case .notCritical:
			return "Not Critical"
		case .notApplicable:
			return "Not Applicable"
		}
	}

	

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	func loadData() {
		guard let path = Bundle.main.path(forResource: "violations", ofType: "json"),
			let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options:  NSData.ReadingOptions.mappedIfSafe),
			let violationsJSON = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as? NSArray else {
				return
		}
		
		if let violations = violationsJSON as? [[String:Any]] {
			for violationDict in violations {
				if let viol = Violation(withDict: violationDict) {
					self.violations.append(viol)
				}
			}
		}
	}
	
	func byCrit(_ critical: Critical) -> [Violation]? {
		let filter: (Violation) -> Bool
		switch critical {
		case .critical:
			filter = { (a) -> Bool in
				a.criticalFlag == "Critical"
			}
		case .notCritical:
			filter = { (a) -> Bool in
				a.criticalFlag == "Not Critical"
			}
		case .notApplicable:
			filter = { (a) -> Bool in
				a.criticalFlag == "Not Applicable"
			}
		}
		// after filtering, sort
		let filtered = violations.filter(filter).sorted { $0.dba < $1.dba }
		return filtered
	}

}
