//
//  ViolationsTableViewController.swift
//  AC3.2-Violations
//
//  Created by Marcel Chaucer on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationsTableViewController: UITableViewController {
    var violations = [Violations]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.title = "Inspection Reports"
        
    }

    func loadData() {
        guard let path = Bundle.main.path(forResource: "violations", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options:  NSData.ReadingOptions.mappedIfSafe),
            let violationsJSON = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as? NSArray else {
                return
        }
        
        if let violations = violationsJSON as? [[String:String]] {
            for violationDict in violations {
                if let ep = Violations(withDict: violationDict) {
                    self.violations.append(ep)
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
        return violations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "violationsCell", for: indexPath)
        let oneViolationCell = violations[indexPath.row]
        cell.textLabel?.text = oneViolationCell.dba
        return cell
    }
    


    
    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let destination = segue.destination as? ViolationsDetails {
                destination.detailViolation =  sender as? Violations
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRestaurant = self.violations[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: selectedRestaurant)
    }

}
