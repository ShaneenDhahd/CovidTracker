//
//  ApiCallBack.swift
//  Covid Tracker
//
//  Created by Shaneen Dhahd on 05/11/2022.
//


import Foundation

enum ApiCallback<Model: Encodable> {
	case success(model: Model)
	case failure(String)
}
