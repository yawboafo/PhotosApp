//
//  APIService.swift
//  PhotosApp
//
//  Created by Engineer 144 on 25/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation


enum RequestError : Error {
	case badUrl
	case badData
}

class APIService : NSObject {
	let photosStaticURL = "https://jsonplaceholder.typicode.com/photos"
	
	func getPhotos(completionHandler : @escaping(Photos,Error?) -> Void){
		guard let url = URL(string: photosStaticURL) else { return completionHandler([],RequestError.badUrl) }
		let session = URLSession(configuration: .default)
		let task = session.dataTask(with: url) { (data, response, error) in
			guard let _data = data else { return  }
			let photos = try? JSONDecoder().decode(Photos.self, from: _data)
			guard let photosData = photos else { return  completionHandler([],RequestError.badData)}
			
 			completionHandler(photosData,nil)
		}
		
		task.resume()
	}
}
