//
//  Violations.swift
//  AC3.2-Violations
//
//  Created by Marcel Chaucer on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Violations {

    let action: String
    let boro: String
    let building: String
    let camis: String
    let criticalFlag: String
    let cuisineDescription: String
    let dba: String
    let grade: String
    let gradeDate: String
    let inspectionDate: String
    let inspectionType: String
    let phone: String
    let recordDate: String
    let score: String
    let street: String
    let violationCode: String
    let violationDescription: String
    let zipcode: String
    
    init(action: String, boro: String, building: String, camis: String, criticalFlag: String, cuisineDescription: String, dba: String, grade: String, gradeDate: String, inspectionDate: String, inspectionType: String, phone: String, recordDate: String, score: String, street: String, violationCode: String, violationDescription: String, zipcode: String) {
        
        self.action = action
        self.boro = boro
        self.building = building
        self.camis = camis
        self.criticalFlag = criticalFlag
        self.cuisineDescription = cuisineDescription
        self.dba = dba
        self.grade = grade
        self.gradeDate = gradeDate
        self.inspectionDate = inspectionDate
        self.inspectionType = inspectionType
        self.phone = phone
        self.recordDate = recordDate
        self.score = score
        self.street = street
        self.violationCode = violationCode
        self.violationDescription = violationDescription
        self.zipcode = zipcode
        }
    
    convenience init?(withDict dict: [String:Any]) {
        if let action = dict["action"] as? String,
            let boro = dict["boro"] as? String,
            let building = dict["building"] as? String,
            let camis = dict["camis"] as? String,
            let criticalFlag = dict["critical_flag"] as? String,
            let cuisineDescription = dict["cuisine_description"] as? String,
            let dba = dict["dba"] as? String,
            let grade = dict["grade"] as? String,
            let gradeDate = dict["grade_date"] as? String,
            let inspectionDate = dict["inspection_date"] as? String,
            let inspectionType = dict["inspection_type"] as? String,
            let phone = dict["phone"] as? String,
            let recordDate = dict["record_date"] as? String,
            let score = dict["score"] as? String,
            let street = dict["street"] as? String,
            let violationCode = dict["violation_code"] as? String,
            let violationDescription = dict["violation_description"] as? String,
            let zipcode = dict["zipcode"] as? String

            
        {
            self.init(action: action, boro: boro, building: building, camis: camis, criticalFlag: criticalFlag, cuisineDescription: cuisineDescription, dba: dba, grade: grade, gradeDate: gradeDate, inspectionDate: inspectionDate, inspectionType: inspectionType, phone: phone, recordDate: recordDate, score: score, street: street, violationCode: violationCode, violationDescription: violationDescription, zipcode: zipcode)
        }
        else {
            return nil
        }
    }
}

