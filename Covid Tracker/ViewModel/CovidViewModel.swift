//
//  CovidViewModel.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 05/11/2022.
//

import Foundation

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
		AlamofireBuilder().getCurrentStatus { response in
			self.hideLoading?()
			switch(response){
				case .success(let model):
					if let model = model {
						self.createCell(datas: model)
						self.reloadTableView?()
					}
				case .failure(_):
					self.showError?()
			}
		}
//		Alamo.getDataFromServer { (success, data) in
//			self.hideLoading?()
//			if success {
//				self.createCell(datas: data!)
//				self.reloadTableView?()
//			} else {
//				self.showError?()
//			}
//		}
	}
	
	var numberOfCells: Int {
		return cellViewModels.count
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
