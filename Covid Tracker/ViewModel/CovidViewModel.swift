//
//  CovidViewModel.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 05/11/2022.
//

import Foundation
import UIKit
import RealmSwift

class CovidViewModel {
	
	
	var datas: CovidModel = CovidModel()
	var reloadTableView: (()->())?
	var showError: (()->())?
	var showLoading: (()->())?
	var hideLoading: (()->())?
	
	private var cellViewModels: CovidModel = CovidModel() {
		didSet {
			self.reloadTableView?()
		}
	}
	
	func getData(){
		showLoading?()
		AlamofireBuilder().getDailyStatus { response in
			self.hideLoading?()
			switch(response){
				case .success(let model):
					if let model = model {
						let covidList = model.prefix(upTo: 10)
						self.createCell(datas: Array(covidList))
						self.storeData()
						self.reloadTableView?()
					}
				case .failure(_):
					self.retriveData()
					//self.showError?()
			}
		}
	}
	
	private func storeData(){
		let realm = try! Realm()
		
		try! realm.write({
			clearCache(realm)
			let covidRealm = CovidRealmModel()
			covidRealm.covidModel = items
			realm.add(covidRealm)
		})
	
	}
	
	private func retriveData(){
		let realm = try! Realm()
		let realmData = realm.object(ofType: CovidRealmModel.self, forPrimaryKey: "CovidRealm")
		if let covidList = realmData?.covidModel {
			self.createCell(datas: covidList)
			self.reloadTableView?()
		} else {
			
		}
	}
	
	private func clearCache(_ realm: Realm) {
		let covidRealmObject = realm.object(ofType: CovidRealmModel.self, forPrimaryKey: "CovidRealm")
		if let covidRealmObject = covidRealmObject {
			realm.delete(covidRealmObject.self)
		}
	}
	
	var numberOfCells: Int {
		return cellViewModels.count
	}
	
	var items: [CovidModelElement]? {
		return cellViewModels
	}
	
	func getCellViewModel( at indexPath: IndexPath ) -> CovidModelElement {
		return cellViewModels[indexPath.row]
	}
	
	func createCell(datas: [CovidModelElement]){
		self.datas = datas
		var vms = CovidModel()
		for data in datas {
			vms.append(data)
		}
		cellViewModels = vms
	}
}
