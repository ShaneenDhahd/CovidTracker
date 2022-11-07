//
//  AlamofireBuilder.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 05/11/2022.
//

import Foundation
import Alamofire

class AlamofireBuilder {
	private let af = Alamofire.AF
	
	func getCurrentStatus( completion: @escaping (ApiCallback<CovidModel?>)->() ){
		af.request("https://api.covidtracking.com/v1/us/daily.json", method: .get).response { data in
			completion(self.parseData(data: data.data))
			
		}
	}
	
	private func parseData<Model: Decodable>(data: Data?) -> ApiCallback<Model> {
		guard let data = data else {return ApiCallback.failure("Data are nil")}
		do {
			let data = try JSONDecoder().decode(Model.self, from: data)
			//print(data)
			return .success(model: data)
		} catch {
			print("data erorr \(error)")
			return .failure(error.localizedDescription)
		}
	}
}
