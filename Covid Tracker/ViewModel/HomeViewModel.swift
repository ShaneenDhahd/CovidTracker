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
	
	var errorMsg = "Looks like you are offline. Don't worry enjoy"

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
					print("call succeeded")

					if let data = model?.first, let model = model {
						self.homeCovidData = data
						self.storeData()
					}
				case .failure(_):
					print("call failer")
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
			print("realmData 1 \((covidRealm.covidModel?.positive)!)")
		})
	}
	
	private func retriveData(){
		let realm = try! Realm()
		let realmData = realm.object(ofType: HomeCovidRealmModel.self, forPrimaryKey: "HomeCovidRealm")
		print("realmData 2 \(realmData?.covidModel)")
		if let covidData = realmData?.covidModel {
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
