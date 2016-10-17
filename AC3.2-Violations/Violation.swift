//
//  Violation.swift
//  AC3.2-Violations
//
//  Created by Ana Ma on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation
/*
{
    "action": "Violations were cited in the following area(s).",
    "boro": "QUEENS",
    "building": "4277",
    "camis": "50038414",
    "critical_flag": "Not Critical",
    "cuisine_description": "Caf\u00c3\u00a9/Coffee/Tea",
    "dba": "ETTO EXPRESSO BAR",
    "grade": "A",
    "grade_date": "2016-01-06T00:00:00.000",
    "inspection_date": "2016-01-06T00:00:00.000",
    "inspection_type": "Cycle Inspection / Initial Inspection",
    "phone": "7187864320",
    "record_date": "2016-10-15T06:04:14.000",
    "score": "10",
    "street": "HUNTER ST",
    "violation_code": "10F",
    "violation_description": "Non-food contact surface improperly constructed. Unacceptable material used. Non-food contact surface or equipment improperly maintained and/or not properly sealed, raised, spaced or movable to allow accessibility for cleaning on all sides, above and underneath the unit.",
    "zipcode": "11101"
},
*/

class Violation {
    var action: String
    var boro: String
    var building: String
    var camis: String
    var critical_flag: String
    var cuisine_description: String
    var dba: String
    var grade: String
    var grade_date: String
    var inspection_date: String
    var inspection_type: String
    var phone: String
    var record_date: String
    var score: String
    var street: String
    var violation_code: String
    var violation_description: String
    var zipcode: String
    
    init (action: String,
          boro: String,
          building: String,
          camis: String,
          critical_flag: String,
          cuisine_description: String,
          dba: String,
          grade: String,
          grade_date: String,
          inspection_date: String,
          inspection_type: String,
          phone: String,
          record_date: String,
          score: String,
          street: String,
          violation_code: String,
          violation_description: String,
          zipcode: String) {
        self.action = action
        self.boro = boro
        self.building = building
        self.camis = camis
        self.critical_flag = critical_flag
        self.cuisine_description = cuisine_description
        self.dba = dba
        self.grade = grade
        self.grade_date = grade_date
        self.inspection_date = inspection_date
        self.inspection_type = inspection_type
        self.phone = phone
        self.record_date = record_date
        self.score = score
        self.street = street
        self.violation_code = violation_code
        self.violation_description = violation_description
        self.zipcode = zipcode
    }

    convenience init? (withDict dict: [String: Any]) {
        if let action = dict["action"] as? String,
            let boro = dict["boro"] as? String,
            let building = dict["building"] as? String,
            let camis = dict["camis"] as? String,
            let critical_flag = dict["critical_flag"] as? String,
            let cuisine_description = dict["cuisine_description"] as? String,
            let dba = dict["dba"] as? String,
            let grade = dict["grade"] as? String,
            let grade_date = dict["grade_date"] as? String,
            let inspection_date = dict["inspection_date"] as? String,
            let inspection_type = dict["inspection_type"] as? String,
            let phone = dict["phone"] as? String,
            let record_date = dict["record_date"] as? String,
            let score = dict["score"] as? String,
            let street = dict["street"] as? String,
            let violation_code = dict["violation_code"] as? String,
            let violation_description = dict["violation_description"] as? String,
            let zipcode = dict["zipcode"] as? String{
            self.init(action: action, boro: boro, building: building, camis: camis, critical_flag: critical_flag, cuisine_description: cuisine_description, dba: dba, grade: grade, grade_date: grade_date, inspection_date:inspection_date, inspection_type: inspection_type, phone: phone, record_date: record_date, score: score, street: street, violation_code: violation_code, violation_description: violation_description, zipcode: zipcode)
        } else {
            return nil
        }
        
    }
}
