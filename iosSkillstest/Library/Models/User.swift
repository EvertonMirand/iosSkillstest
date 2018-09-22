//
//  User.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 22/09/18.
//  Copyright © 2018 Everton Miranda Vitório. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import Realm

class User: Object {
    @objc dynamic var name: String!
    @objc dynamic var email: String!
    @objc dynamic var password: String!
    
    override class func primaryKey() -> String? {
        return "email"
    }
}
