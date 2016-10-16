//
//  ViolationsTableViewController.swift
//  AC3.2-Violations
//
//  Created by Tom Seymour on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationsTableViewController: UITableViewController {
    
    var violatingRestaurants = [ViolatingRestaurant]()

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
        
        if let violations = violationsJSON as? [[String:Any]] {
            for violationDict in violations {
                if let vr = ViolatingRestaurant(withDict: violationDict) {
                    self.violatingRestaurants.append(vr)
                }
            }
        }
        violatingRestaurants = violatingRestaurants.sorted { $0.date < $1.date }
    }

//  Tried to do sections by years. Got stuck, ran out of time and retreated to certainty 
    
//    func anArrayOfYears(fromArr: [ViolatingRestaurant]) -> [Int] {
//        var arraySortedByYear = fromArr.sorted { $0.year < $1.year }
//        var currentYear = arraySortedByYear[0].year
//        var arrayOfYears: [Int] = [currentYear]
//        for thisOne in arraySortedByYear {
//            if thisOne.year != currentYear {
//                arrayOfYears.append(thisOne.year)
//                currentYear = thisOne.year
//            }
//        }
//        return arrayOfYears
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
//        let arrayOfYears = self.anArrayOfYears(fromArr: violatingRestaurants)
//        let number = arrayOfYears.count
        return 1
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let arrayOfYears = self.anArrayOfYears(fromArr: violatingRestaurants)
//        let yearForThisSection = arrayOfYears[section]
//        return String(yearForThisSection)
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let arrayOfYears = self.anArrayOfYears(fromArr: violatingRestaurants)
//        let yearForThisSection = arrayOfYears[section]
//        let arrayByYear = violatingRestaurants.filter { $0.year == yearForThisSection }
//        return arrayByYear.count
        return violatingRestaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let arrayOfYears = self.anArrayOfYears(fromArr: violatingRestaurants)
//        let yearForThisSection = arrayOfYears[indexPath.section]
//        let arrayByYear = violatingRestaurants.filter { $0.year == yearForThisSection }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViolationDetailCell", for: indexPath)
        let thisViolatingRestaurant = violatingRestaurants[indexPath.row]
        cell.textLabel?.text = thisViolatingRestaurant.name
        cell.detailTextLabel?.text = "\(thisViolatingRestaurant.street). Inspected: \(thisViolatingRestaurant.date)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let arrayOfYears = self.anArrayOfYears(fromArr: violatingRestaurants)
//        let yearForThisSection = arrayOfYears[indexPath.section]
//        let arrayByYear = violatingRestaurants.filter { $0.year == yearForThisSection }
        
        let selectedViolation = violatingRestaurants[indexPath.row]
        performSegue(withIdentifier: "ViolationDetailSegue", sender: selectedViolation)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViolationDetailSegue" {
            let destinationVC = segue.destination as! ViolationDetailViewController
            let thisGuy = sender as! ViolatingRestaurant
            destinationVC.thisViolatingRestaurant = thisGuy
        }
    }
}
