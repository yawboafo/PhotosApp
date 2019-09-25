//
//  ListViewController.swift
//  PhotosApp
//
//  Created by Engineer 144 on 25/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
	lazy var listTableView: UITableView = {
		let view = UITableView(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.delegate = self
		view.dataSource = self
		view.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
		view.backgroundColor = .white
		
		return view
	}()
	
	var tableviewData : Photos? {
		didSet{
		
		}
		willSet{
			DispatchQueue.main.async {
					self.listTableView.reloadData()
			}
			
		}
	}
	var viewsModel : PhotosViewModel!
	let searchController = UISearchController(searchResultsController: nil)
	
  override func viewDidLoad() {
        super.viewDidLoad()
		
		addSearchBar()
		viewsModel =  PhotosViewModel(service: APIService())
		guard let _viewsModel = viewsModel else { return  }
		_viewsModel.delegate = self
		_viewsModel.getmeAllPhotos()
			
    }
	func addSearchBar(){
		edgesForExtendedLayout = []
		self.navigationItem.searchController =  searchController
		searchController.searchBar.delegate = self
		definesPresentationContext  = true
		searchController.obscuresBackgroundDuringPresentation = false
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
	override func viewDidLayoutSubviews() {
		view.addSubview(listTableView)
		listTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
		listTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
		listTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		listTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

	}
	
}


extension ListViewController : UISearchBarDelegate{
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		
	}
}

extension ListViewController : UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (tableviewData ?? []).count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
		let modelData : PhotosModel  = (tableviewData ?? [])[indexPath.item]
		cell.titleLabel.text = modelData.title
		cell.iconView.setImage(url: modelData.thumbnailURL)
		return cell
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let modelData : PhotosModel  = (tableviewData ?? [])[indexPath.item]
		let detailView = ListDetailViewController()
		viewsModel.activePhotoModel = modelData
		detailView.viewsModel = viewsModel
		self.show(detailView, sender: self)
	}
}


extension ListViewController: PhotosViewModelDelegate{
	func getPhotosBegan() {
		
	}
	func getPhotosFailed(error: Error?) {
		print(error)
	}
	func getPhotosSuccess(photos: Photos) {
		//print(photos)
		self.tableviewData = photos
	}
	
	
}


extension UIImageView {
	func setImage(url: String){
		guard let _url = URL(string: url) else { return  }
		let ops = BlockOperation {
			URLSession.shared.dataTask(with: _url, completionHandler: { (data, response, error) in
				guard let http = response as? HTTPURLResponse,http.statusCode == 200,
				let data = data,error == nil,
				let image = UIImage(data: data)
					else { return }
				DispatchQueue.main.async {
					self.image = image
				}
			}).resume()
		}
		
		
		OperationQueue().addOperation(ops)
	}
}


