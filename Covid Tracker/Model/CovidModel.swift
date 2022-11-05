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
	let positive, negative, pending: Int?
	let death: Int?
	let totalTestResults: Int
	let total, posNeg, deathIncrease, hospitalizedIncrease: Int
	let negativeIncrease, positiveIncrease, totalTestResultsIncrease: Int
	let hash: String
}

typealias CovidModel = [CovidModelElement]
