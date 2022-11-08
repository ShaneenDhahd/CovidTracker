//
//  CovidModel.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 05/11/2022.
//

import Foundation

// MARK: - CovidModelElement
struct CovidModelElement: Codable {
	let date, states: Int
	let positive, negative, pending, hospitalized: Int?
	let death: Int?
	let totalTestResults: Int
	let total, posNeg, deathIncrease, hospitalizedIncrease: Int
	let negativeIncrease, positiveIncrease, totalTestResultsIncrease: Int
	
	var totalCases: Int {
		if let positive = positive, let negative = negative, let death = death {
			return positive + negative + death
		}
		return 0
	}
	var deathPercentage: CGFloat {
		return death.getPercentage(of: totalCases)
	}
	var positivePercentage: CGFloat {
		return positive.getPercentage(of: totalCases)
	}
	var negativePercentage: CGFloat {
		return negative.getPercentage(of: totalCases)
	}
}

typealias CovidModel = [CovidModelElement]
