//
//  FooterCell.swift
//  Twitter
//
//  Created by Sam Louis Walker-Penn on 02/12/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class FooterCell: BaseCell {
	
	class PaddingLabel: UILabel {
		
		var insets: UIEdgeInsets = .zero
		
		override func drawText(in rect: CGRect) {
			super.drawText(in: rect.inset(by: insets))
		}
		
		override var intrinsicContentSize: CGSize {
			let size = super.intrinsicContentSize
			return CGSize(width: size.width + insets.left + insets.right,
						  height: size.height + insets.top + insets.bottom)
		}
	}
	
	let label: PaddingLabel = {
		let label = PaddingLabel()
		label.text = "Show me more"
		label.font = footerFont
		label.textColor = twitterBlue
		label.backgroundColor = .white
		label.insets = UIEdgeInsets(top: outerMargin, left: outerMargin, bottom: outerMargin, right: outerMargin)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override func setupViews() {
		contentView.addSubview(label)
		contentView.addSubview(divider)
		divider.backgroundColor = .clear
	}
	
	override func setupConstraints() {
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: contentView.topAnchor),
			label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			label.bottomAnchor.constraint(equalTo: divider.topAnchor),
			
			divider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			divider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			divider.heightAnchor.constraint(equalToConstant: outerMargin),
			])
		
	}
}
