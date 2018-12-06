//
//  Tweet.swift
//  Twitter
//
//  Created by Sam Louis Walker-Penn on 03/12/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import Foundation

struct Tweet: Decodable {
	var user: User?
	var image: Image?
	var message: String?
}
