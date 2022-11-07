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
	
//	init(date: Int, states: Int, positive: Int?, negative: Int?, pending: Int?, death: Int?, totalTestResults: Int, total: Int, posNeg: Int, deathIncrease: Int, hospitalizedIncrease: Int, negativeIncrease: Int, positiveIncrease: Int, totalTestResultsIncrease: Int) {
//		self.date = date
//		self.states = states
//		self.positive = positive
//		self.negative = negative
//		self.pending = pending
//		self.death = death
//		self.totalTestResults = totalTestResults
//		self.total = total
//		self.posNeg = posNeg
//		self.deathIncrease = deathIncrease
//		self.hospitalizedIncrease = hospitalizedIncrease
//		self.negativeIncrease = negativeIncrease
//		self.positiveIncrease = positiveIncrease
//		self.totalTestResultsIncrease = totalTestResultsIncrease
//	}
}

typealias CovidModel = [CovidModelElement]
