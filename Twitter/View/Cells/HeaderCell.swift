//
//  HeaderCell.swift
//  Twitter
//
//  Created by Sam Louis Walker-Penn on 02/12/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class HeaderCell: BaseCell {
	
	let label: UILabel = {
		let label = UILabel()
		label.text = "WHO TO FOLLOW"
		label.font = headerFont
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override func setupCell() {
		contentView.backgroundColor = .white
	}
	
	override func setupViews() {
		contentView.addSubview(label)
		contentView.addSubview(divider)
	}
	
	override func setupConstraints() {
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: outerMargin),
			label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: outerMargin),
			label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -outerMargin),
			label.bottomAnchor.constraint(equalTo: divider.topAnchor, constant: -outerMargin),
			
			divider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			divider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			divider.heightAnchor.constraint(equalToConstant: 0.5),
			])
	}
}
