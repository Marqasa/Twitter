//
//  Extensions.swift
//  Twitter
//
//  Created by Sam Louis Walker-Penn on 01/12/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import UIKit

extension UIView {
	
	var safeFrame: CGRect {
		if #available(iOS 11, *) {
			return safeAreaLayoutGuide.layoutFrame
		} else {
			return frame
		}
	}
	
	func fillSuperview() {
		guard let superview = superview else { return }
		translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			leadingAnchor.constraint(equalTo: superview.leadingAnchor),
			trailingAnchor.constraint(equalTo: superview.trailingAnchor),
			topAnchor.constraint(equalTo: superview.topAnchor),
			bottomAnchor.constraint(equalTo: superview.bottomAnchor)
			])
	}
	
	func fillSuperview(withInsets insets: UIEdgeInsets) {
		guard let superview = superview else { return }
		translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			leftAnchor.constraint(equalTo: superview.leftAnchor, constant: insets.left),
			rightAnchor.constraint(equalTo: superview.rightAnchor, constant: insets.right),
			topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top),
			bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: insets.bottom),
			])
	}
	
	@available(iOS 11.0, *)
	func fillSuperview(withInsets insets: NSDirectionalEdgeInsets) {
		guard let superview = superview else { return }
		translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.leading),
			trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: insets.trailing),
			topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top),
			bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: insets.bottom),
			])
	}
}

extension UIColor {
	
	convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
		self.init(r: r, g: g, b: b, a: 1)
	}
	
	convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
		self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
	}
}
