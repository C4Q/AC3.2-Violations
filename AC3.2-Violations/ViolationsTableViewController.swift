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
	var uniqueDBA = [String:Any]()
	var sortedDBAs = [String]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		loadData()
		for all in violations {
			uniqueDBA.updateValue(1, forKey: all.dba)
		}
		sortedDBAs = Array(uniqueDBA.keys).sorted()
		dump(uniqueDBA)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sortedDBAs.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		let incidents = violations.filter { (violation) -> Bool in
			(violation.dba) == sortedDBAs[section]
		}
		
		return incidents.count
	}


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vioID", for: indexPath) as! ViolationsTableViewCell

        // Configure the cell...
	
		let section = violations.filter { (violation) -> Bool in
			(violation.dba) == sortedDBAs[indexPath.section]
		}
		
		let filtered = section.sorted { $0.inspectionDate < $1.inspectionDate }
		
		let data = filtered[indexPath.row]
		cell.nameLabel.text = data.dba
		cell.infoLabel.text = data.dateInMMDDYYYY(for: data.inspectionDate)
		return cell
    }
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return sortedDBAs[section]
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
}
