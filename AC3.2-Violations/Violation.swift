//
//  Violations.swift
//  AC3.2-Violations
//
//  Created by Victor Zhong on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Violation {
	
	let dba: String
	let cuisine: String
	let criticalFlag: String
	let inspectionDate: String
	let inspectionType: String
	let violationCode: String
	let violationDesc: String
	let address: String
	
	init(dba: String, cuisine: String, criticalFlag: String, inspectionDate: String, inspectionType: String, violationCode: String, violationDesc: String, address: String) {
		self.dba = dba
		self.cuisine = cuisine
		self.criticalFlag = criticalFlag
		self.inspectionDate = inspectionDate
		self.inspectionType = inspectionType
		self.violationCode = violationCode
		self.violationDesc = violationDesc
		self.address = address
	}
	
	convenience init?(withDict dict: [String:Any]) {
		if let dba = dict["dba"] as? String,
			let cuisine = dict["cuisine_description"] as? String,
			let criticalFlag = dict["critical_flag"] as? String,
			let inspectionDate = dict["inspection_date"] as? String,
			let inspectionType = dict["inspection_type"] as? String,
			let violationCode = dict["violation_code"] as? String,
			let violationDesc = dict["violation_description"] as? String,
			let building = dict["building"] as? String,
			let street = dict["street"] as? String,
			let boro = dict["boro"] as? String,
			let zipcode = dict["zipcode"] as? String
		{
			self.init(dba: dba, cuisine: cuisine, criticalFlag: criticalFlag, inspectionDate: inspectionDate, inspectionType: inspectionType, violationCode: violationCode, violationDesc: violationDesc, address: "\(building) \(street), \(boro), NY \(zipcode)")
		}
		else {
			return nil
		}
	}
	
	// For switching date metadata to something more digestible
	public func dateInMMDDYYYY(for date: String) -> String {
		var newDate = String()
		let separators = CharacterSet(charactersIn: "-,T")
		let separatedDate = date.components(separatedBy: separators)
		switch separatedDate[1] {
		case "01": newDate += "January"
		case "02": newDate += "February"
		case "03": newDate += "March"
		case "04": newDate += "April"
		case "05": newDate += "May"
		case "06": newDate += "June"
		case "07": newDate += "July"
		case "08": newDate += "August"
		case "09": newDate += "September"
		case "10": newDate += "October"
		case "11": newDate += "November"
		case "12": newDate += "December"
		default: return date
		}
		
		newDate += " \(separatedDate[2]), \(separatedDate[0])"
		return newDate
	}
}
