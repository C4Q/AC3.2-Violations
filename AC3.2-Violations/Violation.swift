//
//  Violations.swift
//  AC3.2-Violations
//
//  Created by Victor Zhong on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Violation {
	
	/*
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
	*/
	
	let dba: String
	let cuisine: String
	let criticalFlag: String
	let inspectionDate: String
//	let violationCode: String
//	let violationDesc: String
//	let building: Int
//	let street: String
//	let zipcode: Int
	
	init(dba: String, cuisine: String, criticalFlag: String, inspectionDate: String) { /*, violationCode: String, violationDesc: String, building: Int, street: String, zipcode: Int) { */
		self.dba = dba
		self.cuisine = cuisine
		self.criticalFlag = criticalFlag
		self.inspectionDate = inspectionDate
//		self.violationCode = violationCode
//		self.violationDesc = violationDesc
//		self.building = building
//		self.street = street
//		self.zipcode = zipcode
	}
	
	convenience init?(withDict dict: [String:Any]) {
		if let dba = dict["dba"] as? String,
			let cuisine = dict["cuisine_description"] as? String,
//			let grade = dict["grade"] as? String,
			let criticalFlag = dict["critical_flag"] as? String,
			let inspectionDate = dict["inspection_date"] as? String/*,
			let violationCode = dict["violation_code"] as? String,
			let violationDesc = dict["violation_description"] as? String,
			let building = dict["building"] as? Int,
			let street = dict["street"] as? String,
			let zipcode = dict["zipcode"] as? Int*/
		{
			self.init(dba: dba, cuisine: cuisine, criticalFlag: criticalFlag, inspectionDate: inspectionDate/*, violationCode: violationCode, violationDesc: violationDesc, building: building, street: street, zipcode: zipcode*/)
		}
		else {
			return nil
		}
	}
	
	public func dateInMMDDYYYY(for date: String) -> String {
		var newDate = String()
		let separators = CharacterSet(charactersIn: "-,T")
		let separatedDate = date.components(separatedBy: separators)
		switch Int(separatedDate[1])! {
		case 01: newDate += "January"
		case 02: newDate += "February"
		case 03: newDate += "March"
		case 04: newDate += "April"
		case 05: newDate += "May"
		case 06: newDate += "June"
		case 07: newDate += "July"
		case 08: newDate += "August"
		case 09: newDate += "September"
		case 10: newDate += "October"
		case 11: newDate += "November"
		case 12: newDate += "December"
		default:
			return date
		}
		newDate += " \(separatedDate[2]), \(separatedDate[0])"
		return newDate
	}
}
