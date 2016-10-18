//
//  Violations.swift
//  AC3.2-Violations
//
//  Created by Kadell on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Violations {

    var boro: String
    var criticalLevel: String
    var score: String
    var name: String
    var cuisineDescription: String
    var violationDescription: String
    var inspectionDate: String
    var inspectionType: String
    var violationCode: String
    
    init(boro:String, criticalLevel:String, score:String, name: String, cuisineDescription: String, violationDescription:String, inspectionDate: String, inspectionType: String, violationCode: String) {
        
        self.boro = boro
        self.criticalLevel = criticalLevel
        self.score = score
        self.name = name
        self.cuisineDescription = cuisineDescription
        self.violationDescription = violationDescription
        self.inspectionDate = inspectionDate
        self.inspectionType = inspectionType
        self.violationCode = violationCode
    }

    convenience init?(withDict dict: [String:Any]) {
        if let boro = dict["boro"] as? String,
            let critical = dict["critical_flag"] as? String,
            let score = dict["score"] as? String,
            let name = dict["dba"] as? String,
            let cuisineDescription = dict["cuisine_description"] as? String,
            let violationDescription = dict["violation_description"] as? String,
            let inspectionDate = dict["inspection_date"] as? String,
            let inspectionType = dict["inspection_type"] as? String,
            let violationCode = dict["violation_code"] as? String
        {
            self.init(boro: boro, criticalLevel: critical, score: score, name:name, cuisineDescription: cuisineDescription, violationDescription: violationDescription, inspectionDate: inspectionDate, inspectionType: inspectionType, violationCode: violationCode)
        }
        else {
            return nil
        }
    }

}
