//
//  ViolationsTableViewController.swift
//  AC3.2-Violations
//
//  Created by Kadell on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationsTableViewController: UITableViewController {
    
    var allViolations = [Violations]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func loadData() {
        guard let path = Bundle.main.path(forResource: "violations", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options:  NSData.ReadingOptions.mappedIfSafe),
            let violationsJSON = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as? NSArray else {
                return
        }
        
        if let violations = violationsJSON as? [[String:Any]] {
            for violationDict in violations {
                if let ep = Violations(withDict: violationDict) {
                    self.allViolations.append(ep)
                }
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allViolations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let violation = allViolations[indexPath.row]
        cell.textLabel?.text = violation.name
        cell.detailTextLabel?.text = violation.criticalLevel

        return cell
    }
    

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier  == "segueToDetail", let violation = sender as? Violations {
            
            let violate = segue.destination as! ViewController
            violate.theViolations = violation
            
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedViolation = allViolations[indexPath.row]
        performSegue(withIdentifier: "segueToDetail", sender: selectedViolation)
    }
    

}
