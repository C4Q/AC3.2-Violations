//
//  ViolationsTableViewController.swift
//  AC3.2-Violations
//
//  Created by Eric Chang on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationsTableViewController: UITableViewController {
  
  var restaurants = [Violations]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
          self.restaurants.append(ep)
        }
      }
    }
  }
  
  
  
  // MARK: - Table view data source
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return restaurants.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ViolationCell", for: indexPath)
    if let violationCell = cell as? ViolationsTableViewCell {
      let thisViolation = restaurants[indexPath.row]
      violationCell.thisViolationCell = thisViolation
      
      violationCell.dbaLabel.text = thisViolation.dba
      violationCell.violationCodeLabel.text = "Violation Code: \(thisViolation.violationCode)"
    }
    
    return cell
  }
  
  
  
  // MARK: - Navigation
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let tappedViolation: UITableViewCell = sender as? ViolationsTableViewCell {
      if segue.identifier == "ViolationDetailSegue" {
        let selectedViolation = segue.destination as! ViewController
        let violationIndex: IndexPath = self.tableView.indexPath(for: tappedViolation)!
        selectedViolation.thisViolation = restaurants[violationIndex.row]
        
      }
    }
  }
  
  
}
