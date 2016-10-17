//
//  ViolationsTableViewController.swift
//  AC3.2-Violations
//
//  Created by Sabrina on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationsTableViewController: UITableViewController {

    var violations = [Violations]()
    
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
                if let violation = Violations(withDict: violationDict) {
                    self.violations.append(violation)
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return violations.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "violationCell", for: indexPath)
        let vio = violations[indexPath.row]
        cell.textLabel?.text = vio.dba
        return cell
    }
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let destination = segue.destination as? ViolationDetailsViewController {
                destination.singleViolation =  sender as? Violations
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRestaurant = self.violations[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: selectedRestaurant)
    }


}

