//
//  HomeController.swift
//  Twitter
//
//  Created by Sam Louis Walker-Penn on 01/12/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	let headerCellId = "headerCellId"
	let userCellId = "userCellId"
	let footerCellId = "footerCellId"
	let tweetCellId = "tweetCellId"
	
	var homeFeed: HomeFeed?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		Service.shared.fetchHomeFeed { (homeFeed) in
			self.homeFeed = homeFeed
			self.collectionView.reloadData()
		}
		
		setupNavBar()
		setupCollectionView()
	}
	
	// MARK: Navigation Bar Setup
	private func setupNavBar() {
		
		setupLeftNavItem()
		setupRightNavItems()
		setupTitleNavItem()
		
		navigationController?.navigationBar.isTranslucent = false
		navigationController?.navigationBar.backgroundColor = .white
		navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		
		let divider = UIView()
		divider.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		divider.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(divider)
		
		NSLayoutConstraint.activate([
			divider.topAnchor.constraint(equalTo: view.topAnchor),
			divider.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			divider.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			divider.heightAnchor.constraint(equalToConstant: 0.5),
			])
	}
	
	private func setupLeftNavItem() {
		let followImage = UIImage(named: followImageName)?.withRenderingMode(.alwaysTemplate)
		let followImageView = UIImageView(image: followImage)
		followImageView.tintColor = twitterBlue
		followImageView.contentMode = .scaleAspectFit
		let followButton = UIBarButtonItem(customView: followImageView)
		
		navigationItem.leftBarButtonItem = followButton
	}
	
	private func setupRightNavItems() {
		let searchImage = UIImage(named: searchImageName)?.withRenderingMode(.alwaysTemplate)
		let searchImageView = UIImageView(image: searchImage)
		searchImageView.tintColor = twitterBlue
		searchImageView.contentMode = .scaleAspectFit
		let searchButton = UIBarButtonItem(customView: searchImageView)
		
		let tweetImage = UIImage(named: tweetImageName)?.withRenderingMode(.alwaysTemplate)
		let tweetImageView = UIImageView(image: tweetImage)
		tweetImageView.tintColor = twitterBlue
		tweetImageView.contentMode = .scaleAspectFit
		let tweetButton = UIBarButtonItem(customView: tweetImageView)
		
		navigationItem.rightBarButtonItems = [tweetButton, searchButton]
	}
	
	private func setupTitleNavItem() {
		let titleImageView = UIImageView(image: UIImage(named: logoImageName))
		titleImageView.contentMode = .scaleAspectFit
		
		navigationItem.titleView = titleImageView
	}
	
	// MARK: Collection View Setup
	private func setupCollectionView() {
		
		setupLayout()
		
		collectionView.alwaysBounceVertical = true
		collectionView.backgroundColor = UIColor(r: 232, g: 236, b: 242 )
		collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCellId)
		collectionView.register(UserCell.self, forCellWithReuseIdentifier: userCellId)
		collectionView.register(FooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerCellId)
		collectionView.register(TweetCell.self, forCellWithReuseIdentifier: tweetCellId)
	}
	
	private func setupLayout() {
		
		guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return }
		
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
	}
	
	// MARK: UICollectionViewDataSource
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 2
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		if section > 0 { return homeFeed?.tweets?.count ?? 0 }
		
		return homeFeed?.users?.count ?? 0
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		
		if kind == UICollectionView.elementKindSectionHeader {
			
			let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellId, for: indexPath)
			return header
			
		} else {
			
			let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerCellId, for: indexPath)
			return footer
			
		}
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if indexPath.section == 0 {
			
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userCellId, for: indexPath) as! UserCell
			cell.user = homeFeed?.users?[indexPath.item]
			return cell
			
		} else {
			
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tweetCellId, for: indexPath) as! TweetCell
			cell.tweet = homeFeed?.tweets?[indexPath.item]
			return cell
			
		}
	}
	
	// MARK: UICollectionViewDelegateFlowLayout
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		
		if section > 0 { return .zero }
		
		return CGSize(width: 0, height: headerHeight)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		
		if section > 0 { return .zero }
		
		return CGSize(width: 0, height: footerHeight + outerMargin)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: view.frame.width, height: 999)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		
		return 0
	}
}
