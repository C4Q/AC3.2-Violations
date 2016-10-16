//
//  ViolationTableViewController.swift
//  AC3.2-Violations
//
//  Created by Madushani Lekam Wasam Liyanage on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationTableViewController: UITableViewController {
    
    var records = [Violation]()
    var selectedViolation: Violation?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }

    func loadData() {
        guard let path = Bundle.main.path(forResource: "violations", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options:  NSData.ReadingOptions.mappedIfSafe),
            let violationsJSON = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as? NSArray else {
                return
        }
        
        if let violations = violationsJSON as? [[String:String]] {
            for violationDict in violations {
                if let ep = Violation(withDict: violationDict) {
                    self.records.append(ep)
                }
            }
        }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return records.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "violationIdentifier", for: indexPath)
        
        let cellData = self.records[indexPath.row]
        cell.textLabel?.text = cellData.boro + " : " + cellData.street
        cell.detailTextLabel?.text = "Date & Time: " + cellData.recordDate

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedViolation = self.records[indexPath.row]
        performSegue(withIdentifier: "showViolationDetailIdentifier", sender: selectedViolation)
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showViolationDetailIdentifier" {
            if let dvc = segue.destination as? DetailViewController {
                dvc.recordOfViolation = selectedViolation
            }
        }

    }
 

}
