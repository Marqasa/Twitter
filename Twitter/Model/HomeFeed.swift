//
//  HomeFeed.swift
//  Twitter
//
//  Created by Sam Louis Walker-Penn on 05/12/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import Foundation

class HomeFeed: Decodable {
	var users: [User]?
	var tweets: [Tweet]?
}
