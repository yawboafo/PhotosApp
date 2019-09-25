//
//  PhotosViewModel.swift
//  PhotosApp
//
//  Created by Engineer 144 on 25/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation

protocol PhotosViewModelDelegate {
	func getPhotosBegan()
	func getPhotosFailed(error : Error?)
	func getPhotosSuccess(photos : Photos)
}


class PhotosViewModel : NSObject {
	
	var activePhotoModel : PhotosModel!
	var apiService : APIService!
	var delegate : PhotosViewModelDelegate!
	init(service : APIService) {
		self.apiService = service
	}
	
	func getmeAllPhotos(){
  guard let _delegate = delegate else { return  }
          	_delegate.getPhotosBegan()
		
		apiService.getPhotos { (photos, error) in
			if error != nil {
				_delegate.getPhotosFailed(error: error)
			}else{
				_delegate.getPhotosSuccess(photos: photos)
			}
		}
		
	}
	
}
