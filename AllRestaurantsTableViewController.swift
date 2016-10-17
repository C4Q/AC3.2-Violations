//
//  AllRestaurantsTableViewController.swift
//  AC3.2-Violations
//
//  Created by Cris on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class AllRestaurantsTableViewController: UITableViewController {
    
    var restaurants = [Violations]()

    func loadData() {
        guard let path = Bundle.main.path(forResource: "violations", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options:  NSData.ReadingOptions.mappedIfSafe),
            let violationsJSON = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as? NSArray else {
                return
        }
        
        if let violations = violationsJSON as? [[String:String]] {
            for (index,violationDict) in violations.enumerated() {
                let ep = Violations(withDict: violationDict)
                print(index)
                self.restaurants.append(ep)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allRestaurantsID", for: indexPath)

        let restaurantName = restaurants[indexPath.row]
        print(restaurantName.dba)
        print(restaurantName.building)
        cell.textLabel?.text = restaurantName.dba
    
        return cell
    }
    

     // MARK: - Navigation

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
