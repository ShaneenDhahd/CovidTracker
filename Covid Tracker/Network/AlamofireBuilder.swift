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
		makeRequest(url: .currentStatus) { data in
			completion(self.parseData(data: data))
		}
	}
	
	func getDailyStatus( completion: @escaping (ApiCallback<CovidModel?>)->() ){
		makeRequest(url: .dailyStatus) { data in
			completion(self.parseData(data: data))
		}
	}
	
	private func makeRequest(url: Endpoint, method: HTTPMethod = .get, completion: @escaping (Data?)->()  ){
		af.request(url.url, method: .get, requestModifier: { request in
			request.cachePolicy = .reloadIgnoringCacheData
		}).response { data in
			completion(data.data)
		}
	}
	
	private func parseData<Model: Decodable>(data: Data?) -> ApiCallback<Model> {
		guard let data = data else {return ApiCallback.failure("Data are nil")}
		do {
			let data = try JSONDecoder().decode(Model.self, from: data)
			return .success(model: data)
		} catch {
			return .failure(error.localizedDescription)
		}
	}
}
