//
//  Violations.swift
//  AC3.2-Violations
//
//  Created by Eric Chang on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Violations {
  let boro: String
  let building: String
  let criticalFlag: String
  let cuisineDescription: String
  let dba: String
  let grade: String
  let inspectionDate: String
  let inspectionType: String
  let phone: String
  let score: String
  let street: String
  let violationCode: String
  let violationDescription: String
  let zipcode: String
  
  init(boro: String, building: String, criticalFlag: String, cuisineDescription: String, dba: String, grade: String, inspectionDate: String, inspectionType: String, phone: String, score: String, street: String, violationCode: String, violationDescription: String, zipcode: String) {
    self.boro = boro
    self.building = building
    self.criticalFlag = criticalFlag
    self.cuisineDescription = cuisineDescription
    self.dba = dba
    self.grade = grade
    self.inspectionDate = inspectionDate
    self.inspectionType = inspectionType
    self.phone = phone
    self.score = score
    self.street = street
    self.violationCode = violationCode
    self.violationDescription = violationDescription
    self.zipcode = zipcode
  }
  
  convenience init?(withDict dict: [String: String]) {
    if let boro = dict["boro"],
      let building = dict["building"],
      let criticalFlag = dict["critical_flag"],
      let cuisineDescription = dict["cuisine_description"],
      let dba = dict["dba"],
      let grade = dict["grade"],
      let inspectionDate = dict["inspection_date"],
      let inspectionType = dict["inspection_type"],
      let phone = dict["phone"],
      let score = dict["score"],
      let street = dict["street"],
      let violationCode = dict["violation_code"],
      let violationDescription = dict["violation_description"],
      let zipcode = dict["zipcode"] {
      
      
      var newDate = ""
      var j = 0
      for i in inspectionDate.characters {
        if j < 10 {
          newDate.append(i)
          j += 1
        }
      }
      
      
      self.init(boro: boro, building: building, criticalFlag: criticalFlag, cuisineDescription: cuisineDescription
        , dba: dba, grade: grade, inspectionDate: newDate, inspectionType: inspectionType, phone: phone, score: score, street: street, violationCode: violationCode, violationDescription: violationDescription, zipcode: zipcode)
      
    }
    else { return nil }
  }
  
}


