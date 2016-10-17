//
//  ViolationTableViewController.swift
//  AC3.2-Violations
//
//  Created by Ana Ma on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationTableViewController: UITableViewController {

    var violations = [Violation]()
    
    enum grade: String{
        case A = "A"
        case B = "B"
        case C = "C"
        case Z = "Z"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        print(grade.A.hashValue)
        print("***********")
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
        
        if let violations = violationsJSON as? [[String:Any]] {
            for violationDict in violations {
                if let vio = Violation(withDict: violationDict) {
                    self.violations.append(vio)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //return 2
        return 4
        
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Grade \(grade.A.rawValue)"
        case 1:
            return "Grade \(grade.B.rawValue)"
        case 2:
            return "Grade \(grade.C.rawValue)"
        case 3:
            return "Grade \(grade.Z.rawValue)"
        default:
            return ""
        }
//        switch section{
//        case 0:
//        return "Critical Violation"
//        case 1:
//        return "Not Critical Violation"
//        default:
//        return ""
//        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        switch section{
        case 0:
            return violations.filter({$0.grade == grade.A.rawValue}).count
        case 1:
            return violations.filter({$0.grade == grade.B.rawValue}).count
        case 2:
            return violations.filter({$0.grade == grade.C.rawValue}).count
        case 3:
            return violations.filter({$0.grade == grade.Z.rawValue}).count
        default:
            return 0
        }
//        if section == 0 {
//            return violations.filter({$0.critical_flag == "Critical"}).count
//        } else {
//            return violations.filter({$0.critical_flag == "Not Critical"}).count
//        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gradeA = violations.filter({$0.grade == grade.A.rawValue})
        let gradeB = violations.filter({$0.grade == grade.B.rawValue})
        let gradeC = violations.filter({$0.grade == grade.C.rawValue})
        let gradeZ = violations.filter({$0.grade == grade.Z.rawValue})
        let cell = tableView.dequeueReusableCell(withIdentifier: "violationViewCellIdentifier", for: indexPath)
        if gradeA[indexPath.row].grade == grade.A.rawValue {
            cell.textLabel?.text = gradeA[indexPath.row].dba
            cell.detailTextLabel?.text = gradeA[indexPath.row].critical_flag
        } else if gradeB[indexPath.row].grade == grade.B.rawValue {
            cell.textLabel?.text = gradeB[indexPath.row].dba
            cell.detailTextLabel?.text = gradeB[indexPath.row].critical_flag
        } else if gradeC[indexPath.row].grade == grade.C.rawValue {
            cell.textLabel?.text = gradeC[indexPath.row].dba
            cell.detailTextLabel?.text = gradeC[indexPath.row].critical_flag
        } else {
            cell.textLabel?.text = gradeZ[indexPath.row].dba
            cell.detailTextLabel?.text = gradeZ[indexPath.row].critical_flag
        }

//        let critical = violations.filter({$0.critical_flag == "Critical"})
//        let notCritical = violations.filter({$0.critical_flag == "Not Critical"})
//        let cell = tableView.dequeueReusableCell(withIdentifier: "violationViewCellIdentifier", for: indexPath)
//        if critical[indexPath.row].critical_flag == "Critical" {
//            cell.textLabel?.text = critical[indexPath.row].dba
//            cell.detailTextLabel?.text = critical[indexPath.row].grade
//        } else {
//            cell.textLabel?.text = notCritical[indexPath.row].dba
//            cell.detailTextLabel?.text = notCritical[indexPath.row].grade
//        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedViolation = self.violations[indexPath.row]
        performSegue(withIdentifier: "violationDetailViewSegue", sender: selectedViolation)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "violationDetailViewSegue" {
            let detailController = segue.destination as! ViolationDetailViewController
            let selectedViolation = sender as? Violation
            detailController.violation = selectedViolation
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

    

}
