//
//  User.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/11.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct User {
    let uid: String
    let name: String
    let profileImageUrl: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.name = dictionary["name"] as? String ?? ""
        self.profileImageUrl  = dictionary["profileImageUrl"] as? String ?? ""
    }
}
