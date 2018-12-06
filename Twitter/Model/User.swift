//
//  User.swift
//  Twitter
//
//  Created by Sam Louis Walker-Penn on 02/12/2018.
//  Copyright © 2018 Sam Louis Walker-Penn. All rights reserved.
//

import Foundation

struct User: Decodable {
	var id: Int?
	var name: String?
	var username: String?
	var bio: String?
	var profileImageUrl: String?
}
