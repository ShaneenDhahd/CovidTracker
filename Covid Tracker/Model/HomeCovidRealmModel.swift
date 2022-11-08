//
//  HomeCovidModel.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 08/11/2022.
//

import Foundation
import RealmSwift

class HomeCovidRealmModel : Object {
	
	@objc dynamic var id : String = "HomeCovidRealm"
	
	override class func primaryKey() -> String? {
		"id"
	}
	@objc private dynamic var structData:Data? = nil
	
	var covidModel : CovidModelElement? {
		get {
			if let data = structData {
				return try? JSONDecoder().decode(CovidModelElement.self, from: data)
			}
			return nil
		}
		set {
			structData = try? JSONEncoder().encode(newValue)
		}
	}
}
