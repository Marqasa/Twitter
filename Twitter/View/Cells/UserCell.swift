//
//  UserCell.swift
//  Twitter
//
//  Created by Sam Louis Walker-Penn on 01/12/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class UserCell: BaseCell {
	
	var user: User? {
		didSet {
			if let profileImageUrl = user?.profileImageUrl {
				imageView.loadImage(urlString: profileImageUrl)
			}
			nameLabel.text = user?.name
			userLabel.text = user?.username
			bioLabel.text = user?.bio
			
			setNeedsLayout()
			layoutIfNeeded()
		}
	}
	
	let imageView: CachedImageView = {
		let iv = CachedImageView()
		iv.contentMode = .scaleAspectFill
		iv.clipsToBounds = true
		iv.layer.cornerRadius = imageCornerRadius
		iv.translatesAutoresizingMaskIntoConstraints = false
		return iv
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.font = nameFont
		label.numberOfLines = 1
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let userLabel: UILabel = {
		let label = UILabel()
		label.textColor = .darkGray
		label.font = userFont
		label.numberOfLines = 1
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let followButton: UIButton = {
		let button = UIButton()
		button.tintColor = twitterBlue
		
		button.setTitle("Follow", for: .normal)
		button.setTitleColor(twitterBlue, for: .normal)
		button.titleLabel?.font = followFont
		button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
		
		let image = UIImage(named: followImageName)?.withRenderingMode(.alwaysTemplate)
		button.setImage(image, for: .normal)
		button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
		button.imageView?.contentMode = .scaleAspectFit
		
		button.layer.cornerRadius = cornerRadius
		button.layer.borderColor = twitterBlue.cgColor
		button.layer.borderWidth = 1
		button.translatesAutoresizingMaskIntoConstraints = false
		
		return button
	}()
	
	let bioLabel: UILabel = {
		let label = UILabel()
		label.font = textViewFont
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override func setupCell() {
		contentView.backgroundColor = .white
	}
	
	override func setupViews() {
		contentView.addSubview(imageView)
		contentView.addSubview(nameLabel)
		contentView.addSubview(userLabel)
		contentView.addSubview(followButton)
		contentView.addSubview(bioLabel)
		contentView.addSubview(divider)
	}
	
	override func setupConstraints() {
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: outerMargin),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: outerMargin),
			imageView.heightAnchor.constraint(equalToConstant: imageHeight),
			imageView.widthAnchor.constraint(equalToConstant: imageHeight),
			
			nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
			nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: innerMargin),
			nameLabel.trailingAnchor.constraint(equalTo: followButton.leadingAnchor, constant: -innerMargin),
			nameLabel.heightAnchor.constraint(equalToConstant: nameHeight),
			
			userLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
			userLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
			userLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
			userLabel.heightAnchor.constraint(equalToConstant: nameHeight),
			
			followButton.topAnchor.constraint(equalTo: imageView.topAnchor),
			followButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -outerMargin),
			followButton.heightAnchor.constraint(equalToConstant: followHeight),
			followButton.widthAnchor.constraint(equalToConstant: followWidth),
			
			bioLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: innerMargin),
			bioLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
			bioLabel.trailingAnchor.constraint(equalTo: followButton.trailingAnchor),
			
			divider.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: outerMargin),
			divider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			divider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			divider.heightAnchor.constraint(equalToConstant: 0.5),
			])
	}
	
	override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
		
		let size = contentView.systemLayoutSizeFitting(.zero)
		
		layoutAttributes.frame.size.height = size.height
		
		return layoutAttributes
	}
}
