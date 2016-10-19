//
//  ViolationTableViewController.swift
//  AC3.2-Violations
//
//  Created by Annie Tung on 10/17/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationTableViewController: UITableViewController {
    
    var restaurants = [Violation]()

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
                    self.restaurants.append(ep)
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViolationSegue", for: indexPath)

        let restaurant = restaurants[indexPath.row]
        cell.textLabel?.text = restaurant.dba
        cell.detailTextLabel?.text = restaurant.boro
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurant = restaurants[indexPath.row]
        performSegue(withIdentifier: "ViolationSegue", sender: restaurant)
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViolationSegue" {
            let destinationVC = segue.destination as? ViolationViewController
            destinationVC?.vio = sender as? Violation
        }
    }
}
