//
//  photosModel.swift
//  PhotosApp
//
//  Created by Engineer 144 on 25/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
struct PhotosModel: Codable {
	let albumID, id: Int
	let title: String
	let url, thumbnailURL: String
	
	enum CodingKeys: String, CodingKey {
		case albumID = "albumId"
		case id, title, url
		case thumbnailURL = "thumbnailUrl"
	}
}

typealias Photos = [PhotosModel]
