//
//  ListTableViewCell.swift
//  PhotosApp
//
//  Created by Engineer 144 on 25/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//


import UIKit

class ListTableViewCell : UITableViewCell {
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubViews()
	}
	
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("Required Init")
	}
	
	
	func addSubViews(){
		
		self.heightAnchor.constraint(equalToConstant: 90).isActive = true 
		addSubview(iconView)
		addSubview(titleLabel)
		addSubview(subtitleLabel)
		
		constrainViews()
	}
	
	
	func constrainViews(){
		
		iconView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10).isActive = true
		iconView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		
		iconView.heightAnchor.constraint(equalToConstant: 90).isActive = true
		iconView.widthAnchor.constraint(equalToConstant: 90).isActive = true

		
		titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant: 2).isActive = true
		titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
		
		subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10).isActive = true
		subtitleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant: 2).isActive = true

		
	}
	
	
	lazy var iconView: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode =  UIView.ContentMode.scaleAspectFit
		return image
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Title"
		label.lineBreakMode = .byTruncatingMiddle
		return label
	}()
	
	lazy var subtitleLabel: UILabel = {
		let label = UILabel()
		label.textColor = #colorLiteral(red: 0.2969530523, green: 0.2969608307, blue: 0.2969566584, alpha: 1)
		label.font = UIFont.systemFont(ofSize: 14, weight: .light)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Subtitle"
		return label
	}()
	
}

