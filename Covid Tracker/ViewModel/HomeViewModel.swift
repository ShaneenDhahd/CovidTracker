//
//  HomeViewModel.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 08/11/2022.
//

import Foundation
import UIKit
import RealmSwift

class HomeViewModel {
	
	var errorMsg = "Something went wrong, Please try again later!"

	var homeCovidData: CovidModelElement! = CovidModel().first  {
		didSet {
			self.updateUI?(homeCovidData, errorMsg)
		}
	}
	var updateUI: ((CovidModelElement, String)->())?
	var showError: (()->())?
	var showLoading: (()->())?
	var hideLoading: (()->())?
	
	func getData(){
		showLoading?()
		AlamofireBuilder().getCurrentStatus() { response in
			self.hideLoading?()
			switch(response){
				case .success(let model):
					if let data = model?.first {
						self.homeCovidData = data
						self.storeData()
					}
				case .failure(_):
					self.retriveData()
					self.showError?()

			}
		}
	}
	
	private func storeData(){
		let realm = try! Realm()
		try! realm.write({
			clearCache(realm)
			let covidRealm = HomeCovidRealmModel()
			covidRealm.covidModel = homeCovidData
			realm.add(covidRealm)
		})
	}
	
	private func retriveData(){
		let realm = try! Realm()
		let realmData = realm.object(ofType: HomeCovidRealmModel.self, forPrimaryKey: "HomeCovidRealm")
		if let covidData = realmData?.covidModel {
			errorMsg = "Looks like you are offline. Don't worry enjoy"
			homeCovidData = covidData
		} else {
		}
	}
	private func clearCache(_ realm: Realm) {
		let covidRealmObject = realm.object(ofType: HomeCovidRealmModel.self, forPrimaryKey: "HomeCovidRealm")
		if let covidRealmObject = covidRealmObject {
			realm.delete(covidRealmObject.self)
		}
	}
	
}
