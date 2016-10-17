//
//  Violation.swift
//  AC3.2-Violations
//
//  Created by Harichandan Singh on 10/16/16.
//  Copyright © 2016 Harichandan Singh. All rights reserved.
//

import Foundation

class Violation {
    
    let dba: String
    let street: String
    let boro: String
    let building: String
    let zipcode: String
    let criticalFlag: String
    let inspectionDate: String
    let inspectionType: String
    let violationCode: String
    let violationDesc: String
    
    init(dba: String, street: String, boro: String, building: String, zipcode: String, criticalFlag: String, inspectionDate: String, inspectionType: String, violationCode: String, violationDesc: String) {
        self.dba = dba
        self.street = street
        self.boro = boro
        self.building = building
        self.zipcode = zipcode
        self.criticalFlag = criticalFlag
        self.inspectionDate = inspectionDate
        self.inspectionType = inspectionType
        self.violationCode = violationCode
        self.violationDesc = violationDesc
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let dba = dict["dba"] as? String,
            let street = dict["street"] as? String,
            let boro = dict["boro"] as? String,
            let criticalFlag = dict["critical_flag"] as? String,
            let inspectionDate = dict["inspection_date"] as? String,
            let inspectionType = dict["inspection_type"] as? String,
            let violationCode = dict["violation_code"] as? String,
            let violationDesc = dict["violation_description"] as? String,
            let building = dict["building"] as? String,
            let zipcode = dict["zipcode"] as? String
        {
            self.init(dba: dba, street: street, boro: boro, building: building, zipcode: zipcode, criticalFlag: criticalFlag, inspectionDate: inspectionDate, inspectionType: inspectionType, violationCode: violationCode, violationDesc: violationDesc)
        }
        else {
            return nil
        }
    }

}
