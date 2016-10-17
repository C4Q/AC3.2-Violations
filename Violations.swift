//
//  Violations.swift
//  AC3.2-Violations
//
//  Created by Cris on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Violations {
    
    let boro: String
    let dba: String
    let grade: String
    let building: String
    let street: String
    let zipcode: String
    let phone: String
    let grade_date: String
    let inspection_type: String
    let violation_description: String
//    var fullAddress: String {
//        return building + street
//    }
    
    init(withDict: [String:String]) {
//        if let boro = withDict["boro"],
//        let dba = withDict["dba"],
//        let grade = withDict["grade"],
//        let building = withDict["building"],
//        let street = withDict["street"],
//        let zipcode = withDict["zipcode"],
//        let phone = withDict["phone"],
//        let grade_date = withDict["grade_date"],
//        let inspection_type = withDict["inspection_type"],
//            let violation_description = withDict["violation_description"] {
//            
//            self.boro = boro
//            self.dba = dba
//            self.grade = grade
//            self.building = building
//            self.street = street
//            self.zipcode = zipcode
//            self.phone = phone
//            self.grade_date = grade_date
//            self.inspection_type = inspection_type
//            self.violation_description = violation_description
//            
//        } else {
//            
//            self.boro = "N/A"
//            self.dba = "N/A"
//            self.grade = "N/A"
//            self.building = "N/A"
//            self.street = "N/A"
//            self.zipcode = "N/A"
//            self.phone = "N/A"
//            self.grade_date = "N/A"
//            self.inspection_type = "N/A"
//            self.violation_description = "N/A"
//        
//        }
       boro = withDict["boro"] ?? "No boro"
       dba = withDict["dba"] ?? "N/A"
       grade = withDict["grade"] ?? "N/A"
       building = withDict["building"] ?? "N/A"
       street = withDict["street"] ?? "N/A"
       zipcode = withDict["zipcode"] ?? "N/A"
       phone = withDict["phone"] ?? "N/A"
       grade_date = withDict["grade_date"] ?? "N/A"
       inspection_type = withDict["inspection_type"] ?? "N/A"
       violation_description = withDict["violation_description"] ?? "N/A"
    }
}
