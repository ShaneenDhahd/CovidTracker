//
//  Person.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 07/11/2022.
//

import Foundation
import RealmSwift

class CovidRealmModel : Object {

	@objc dynamic var id : String = "CovidRealm"

	override class func primaryKey() -> String? {
		"id"
	}
	@objc private dynamic var structData:Data? = nil
	
	var covidModel : CovidModel? {
		get {
			if let data = structData {
				return try? JSONDecoder().decode(CovidModel.self, from: data)
			}
			return nil
		}
		set {
			structData = try? JSONEncoder().encode(newValue)
		}
	}
}
