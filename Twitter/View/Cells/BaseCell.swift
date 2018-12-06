//
//  BaseCell.swift
//  App Store
//
//  Created by Sam Louis Walker-Penn on 28/11/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
	
	let divider: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupCell()
		setupViews()
		setupConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func setupViews() {}
	
	func setupConstraints() {}
	
	func setupCell() {}
}
