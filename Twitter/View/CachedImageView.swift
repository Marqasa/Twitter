//
//  CachedImageView.swift
//  Twitter
//
//  Created by Sam Louis Walker-Penn on 05/12/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

class CachedImageView: UIImageView {
	
	static let imageCache = NSCache<NSString, DiscardableImage>()

	func loadImage(urlString: String) {
		
		let urlKey = urlString as NSString
		
		// If the image is already in memory, use the cached image
		if let cachedImage = CachedImageView.imageCache.object(forKey: urlKey) {
			image = cachedImage.image
			return
		}
		
		// Else, load the image from the server if possible
		guard let url = URL(string: urlString) else { return }
		
		URLSession.shared.dataTask(with: url) {data, response, error in
			
			guard let data = data else { return }
			
			DispatchQueue.main.async {
				guard let image = UIImage(data: data) else { return }
				
				let discardableImage = DiscardableImage(image: image)
				
				CachedImageView.imageCache.setObject(discardableImage, forKey: urlKey)
				
				self.image = image
			}
			}.resume()
	}
}

class DiscardableImage: NSDiscardableContent {
	
	var image: UIImage?
	var accessCount: UInt = 0
	
	init(image: UIImage) {
		self.image = image
	}
	
	func beginContentAccess() -> Bool {
		if image == nil {
			return false
		}
		accessCount += 1
		return true
	}
	
	func endContentAccess() {
		if accessCount > 0 {
			accessCount -= 1
		}
	}
	
	func discardContentIfPossible() {
		if accessCount == 0 {
			image = nil
		}
	}
	
	func isContentDiscarded() -> Bool {
		return image == nil
	}
}
