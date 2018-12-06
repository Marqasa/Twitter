//
//  Networking.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 29/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class Service {
	
	static let shared = Service()
	
	func fetchHomeFeed(completion: @escaping (HomeFeed) -> ()) {
		
		let homeUrlString = "https://api.letsbuildthatapp.com/twitter/home"
		
		fetchGenericData(urlString: homeUrlString, completion: completion)
	}
	
	private func fetchGenericData<DataType: Decodable>(urlString: String, completion: @escaping (DataType) -> ()) {
		
		guard let url = URL(string: urlString) else { return }
		
		let urlSession = URLSession.shared.dataTask(with: url) { (data, response, err) in
			
			if let err = err {
				print("Error retrieving data: ", err)
			}
			
			guard let data = data else {
				print("Data not found.")
				return
			}
			
			do {
				let json = try JSONDecoder().decode(DataType.self, from: data)
				
				DispatchQueue.main.async {
					completion(json)
				}
			} catch let err {
				print("Error decoding json: ", err)
			}
		}
		urlSession.resume()
	}
}
