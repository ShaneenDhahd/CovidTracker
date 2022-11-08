//
//  EndPoints.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 09/11/2022.
//

import Foundation
enum Endpoint {
	private var baseURL: String { return "https://api.covidtracking.com/v1/us/" }
	
	case currentStatus
	case dailyStatus
	
	
	private var fullPath: String {
		var endpoint:String
		switch self {
			case .currentStatus:
				endpoint = "current.json"
			case .dailyStatus:
				endpoint = "daily.json"
		}
		return baseURL + endpoint
	}
	
	var url: URL {
		guard let url = URL(string: fullPath) else {
			preconditionFailure("The url used in \(Endpoint.self) is not valid")
		}
		return url
	}
}
