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
	
	init(dba: String, cuisine: String, criticalFlag: String) {
		self.dba = dba
		self.cuisine = cuisine
		self.criticalFlag = criticalFlag
	}
	
	convenience init?(withDict dict: [String:Any]) {
		if let dba = dict["dba"] as? String,
			let cuisine = dict["cuisine_description"] as? String,
//			let grade = dict["grade"] as? String,
			let criticalFlag = dict["critical_flag"] as? String
		{
			self.init(dba: dba, cuisine: cuisine, criticalFlag: criticalFlag)
		}
		else {
			return nil
		}
	}
}
