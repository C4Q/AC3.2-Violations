//
//  Violation.swift
//  AC3.2-Violations
//
//  Created by Annie Tung on 10/17/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Violation {
    let action: String
    let boro: String
    let building: String
    let critical_flag: String
    let dba: String
    let grade: String
    let inspection_date: String
    let inspection_type: String
    let violation_code: String
    
    init(action: String, boro: String, building: String, critical_flag: String, dba: String, grade: String, inspection_date: String, inspection_type: String, violation_code: String){
        self.action = action
        self.boro = boro
        self.building = building
        self.critical_flag = critical_flag
        self.dba = dba
        self.grade = grade
        self.inspection_date = inspection_date
        self.inspection_type = inspection_type
        self.violation_code = violation_code
    }
    convenience init?(withDict dict: [String: String]) {
        if let action = dict["action"],
        let boro = dict["boro"],
        let building = dict["building"],
        let critical_flag = dict["critical_flag"],
        let dba = dict["dba"],
        let grade = dict["grade"],
        let inspection_date = dict["inspection_date"],
        let inspection_type = dict["inspection_type"],
        let violation_code = dict["violation_code"] {
    
        self.init(action: action, boro: boro, building: building, critical_flag:critical_flag, dba:dba, grade:grade, inspection_date:inspection_date, inspection_type:inspection_type, violation_code:violation_code)
        }
        else {
            return nil
        }
    }
}
