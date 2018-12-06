//
//  TweetCell.swift
//  Twitter
//
//  Created by Sam Louis Walker-Penn on 03/12/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class TweetCell: BaseCell {
	
	var tweet: Tweet? {
		didSet {
			if let profileImageUrl = tweet?.user?.profileImageUrl {
				imageView.loadImage(urlString: profileImageUrl)
			}
			nameLabel.text = tweet?.user?.name
			userLabel.text = tweet?.user?.username
			tweetLabel.text = tweet?.message
			
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
		label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
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
	
	let tweetLabel: UILabel = {
		let label = UILabel()
		label.font = textViewFont
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let replyButton: UIButton = {
		let button = UIButton(frame: CGRect(x: 0, y: 0, width: stackHeight, height: stackHeight))
		let image = UIImage(named: replyImageName)?.withRenderingMode(.alwaysTemplate)
		button.setImage(image, for: .normal)
		button.tintColor = .darkGray
		return button
	}()
	
	let retweetButton: UIButton = {
		let button = UIButton(frame: CGRect(x: 0, y: 0, width: stackHeight, height: stackHeight))
		let image = UIImage(named: retweetImageName)?.withRenderingMode(.alwaysTemplate)
		button.setImage(image, for: .normal)
		button.tintColor = .darkGray
		return button
	}()
	
	let favoriteButton: UIButton = {
		let button = UIButton(frame: CGRect(x: 0, y: 0, width: stackHeight, height: stackHeight))
		let image = UIImage(named: favoriteImageName)?.withRenderingMode(.alwaysTemplate)
		button.setImage(image, for: .normal)
		button.tintColor = .darkGray
		return button
	}()
	
	let messageButton: UIButton = {
		let button = UIButton(frame: CGRect(x: 0, y: 0, width: stackHeight, height: stackHeight))
		let image = UIImage(named: messageImageName)?.withRenderingMode(.alwaysTemplate)
		button.setImage(image, for: .normal)
		button.tintColor = .darkGray
		return button
	}()
	
	var stackView: UIStackView!
	
	override func setupCell() {
		contentView.backgroundColor = .white
	}
	
	override func setupViews() {
		contentView.addSubview(imageView)
		contentView.addSubview(nameLabel)
		contentView.addSubview(userLabel)
		contentView.addSubview(tweetLabel)
		contentView.addSubview(divider)
		
		setupActionButtons()
	}
	
	private func setupActionButtons() {
		let replyContainerView = UIView()
		replyContainerView.addSubview(replyButton)
		
		let retweetContainerView = UIView()
		retweetContainerView.addSubview(retweetButton)
		
		let favoriteContainerView = UIView()
		favoriteContainerView.addSubview(favoriteButton)
		
		let messageContainerView = UIView()
		messageContainerView.addSubview(messageButton)
		
		stackView = UIStackView(arrangedSubviews: [replyContainerView, retweetContainerView, favoriteContainerView, messageContainerView])
		stackView.distribution = .fillEqually
		stackView.translatesAutoresizingMaskIntoConstraints = false
		
		contentView.addSubview(stackView)
	}
	
	override func setupConstraints() {
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: outerMargin),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: outerMargin),
			imageView.heightAnchor.constraint(equalToConstant: imageHeight),
			imageView.widthAnchor.constraint(equalToConstant: imageHeight),
			
			nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
			nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: innerMargin),
			nameLabel.heightAnchor.constraint(equalToConstant: nameHeight),
			
			userLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
			userLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: innerMargin),
			userLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			userLabel.heightAnchor.constraint(equalToConstant: nameHeight),
			
			tweetLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: innerMargin),
			tweetLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
			tweetLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -outerMargin),
			
			stackView.topAnchor.constraint(equalTo: tweetLabel.bottomAnchor, constant: innerMargin),
			stackView.leadingAnchor.constraint(equalTo: tweetLabel.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: tweetLabel.trailingAnchor),
			stackView.heightAnchor.constraint(equalToConstant: stackHeight),
			
			divider.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: outerMargin),
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
