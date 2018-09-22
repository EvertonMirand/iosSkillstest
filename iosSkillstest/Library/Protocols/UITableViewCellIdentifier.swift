//
//  UITableViewCellIdentifier.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 22/09/18.
//  Copyright © 2018 Everton Miranda Vitório. All rights reserved.
//

import Foundation
import UIKit

protocol UITableViewCellIdentifier where Self: UITableViewCell {
    static var cellIdentifier: String { get }
}

extension UITableViewCellIdentifier {

    static var cellIdentifier: String {
        return "\(Self.self)"
    }
}
