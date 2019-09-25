//
//  ListDetailViewController.swift
//  PhotosApp
//
//  Created by Engineer 144 on 25/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {

	var viewsModel : PhotosViewModel!
	var subView : ListDetailViewControllerSubViews!
    override func viewDidLoad() {
        super.viewDidLoad()
		  	edgesForExtendedLayout = []
       view.backgroundColor = .white
			 subView =  ListDetailViewControllerSubViews(model: viewsModel)
    }
	override func viewDidLayoutSubviews() {
		
		guard let parentViewsSubView = subView else { return  }
		view.addSubview(parentViewsSubView)
		parentViewsSubView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		parentViewsSubView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		parentViewsSubView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		parentViewsSubView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

	}
	

}



class  ListDetailViewControllerSubViews: UIView {
	
	var viewsModel : PhotosViewModel!
	override init(frame: CGRect) {
		super.init(frame: .zero)
	  	setUpViews()
			setValues()
	   }
	init(frame: CGRect = .zero,model: PhotosViewModel) {
	super.init(frame: .zero)
		viewsModel = model
		setUpViews()
		setValues()
	}
	func setUpViews(){

		translatesAutoresizingMaskIntoConstraints = false
		addSubview(mainImageView)
		addSubview(titleLabel)
		addSubview(goButton)
		
		mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		mainImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4).isActive = true
		mainImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
		
		
		
		titleLabel.trailingAnchor.constraint(equalTo: goButton.leadingAnchor,constant: 10).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10).isActive = true
		titleLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor,constant: 20).isActive = true
		
		goButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
		goButton.topAnchor.constraint(equalTo: mainImageView.bottomAnchor,constant: 20).isActive = true
		goButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
		goButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
		

	}
	func setValues(){
		guard let viewsModel = viewsModel else { return  }
		guard let activeData = viewsModel.activePhotoModel else { return  }
		mainImageView.setImage(url: activeData.url)
		titleLabel.text = activeData.title
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("Init required")
	}
	
	
	
	lazy var mainImageView: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints  = false
		view.contentMode = UIView.ContentMode.scaleAspectFit
		return view
	}()
	
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Title"
		label.lineBreakMode = .byTruncatingMiddle
		label.numberOfLines = 0
		return label
	}()
	
	lazy var subtitleLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Subtitle"
		label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
		label.lineBreakMode = .byTruncatingMiddle
		return label
	}()
	
	lazy var goButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("GO", for: .normal)
		button.titleLabel?.font =  UIFont.systemFont(ofSize: 10, weight: .heavy)
		button.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
		button.layer.cornerRadius = 4
		//button.isOpaque = true
		return button
	}()
	
}
