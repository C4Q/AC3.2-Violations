//
//  ViolatingRestaurant.swift
//  AC3.2-Violations
//
//  Created by Tom Seymour on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class ViolatingRestaurant {
    let name: String
    let cuisineDescription: String
    let grade: String?
    let score: String
    let phone: String
    let building: String
    let street: String
    let boro: String
    let zip: String
    var addressString: String {
        get {
            return "\(building), \(street), \(boro) \(zip)"
        }
    }
    var year: Int {
        get {
            let x = inspectionDate.characters
            let y = String(x.dropLast(x.count - 4))
            if let z = Int(y) {
                return z
            } else {
                return 1066
            }

        }
    }
    var date: String {
        get {
            let x = inspectionDate.characters
            return String(x.dropLast(x.count - 10))
        }
    }
    let inspectionDate: String
    let action: String
    let violationCode: String
    let violationDescription: String
    
    init(name: String, cuisineDescription: String, grade: String?, score: String, phone: String, building: String, street: String, boro: String, zip: String, inspectionDate: String, action: String, violationCode: String, violationDescription: String) {
        self.name = name
        self.cuisineDescription = cuisineDescription
        self.grade = grade
        self.score = score
        self.phone = phone
        self.building = building
        self.street = street
        self.boro = boro
        self.zip = zip
        self.inspectionDate = inspectionDate
        self.action = action
        self.violationCode = violationCode
        self.violationDescription = violationDescription
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["dba"] as? String,
            let cuisineDescription = dict["cuisine_description"] as? String,
            let grade = dict["grade"] as? String?,
            let score = dict["score"] as? String,
            let phone = dict["phone"] as? String,
            let building = dict["building"] as? String,
            let street = dict["street"] as? String,
            let boro = dict["boro"] as? String,
            let zip = dict["zipcode"] as? String,
            let inspectionDate = dict["inspection_date"] as? String,
            let action = dict["action"] as? String,
            let violationCode = dict["violation_code"] as? String,
            let violationDescription = dict["violation_description"] as? String {
            
            self.init(name: name, cuisineDescription: cuisineDescription, grade: grade, score: score, phone: phone, building: building, street: street, boro: boro, zip: zip, inspectionDate: inspectionDate, action: action, violationCode: violationCode, violationDescription: violationDescription)
        }
        else {
            return nil
        }
    }
}

/*
 "action": "Violations were cited in the following area(s).",
 "boro": "QUEENS",
 "building": "3300",
 "camis": "40952325",
 "critical_flag": "Critical",
 "cuisine_description": "American",
 "dba": "BOULEVARD DELI & RESTAURANT",
 "grade": "A",
 "grade_date": "2014-12-15T00:00:00.000",
 "inspection_date": "2014-12-15T00:00:00.000",
 "inspection_type": "Cycle Inspection / Initial Inspection",
 "phone": "7187290277",
 "record_date": "2016-10-15T06:04:14.000",
 "score": "13",
 "street": "NORTHERN BOULEVARD",
 "violation_code": "06C",
 "violation_description": "Food not protected from potential source of contamination during storage, preparation, transportation, display or service.",
 "zipcode": "11101"

*/
