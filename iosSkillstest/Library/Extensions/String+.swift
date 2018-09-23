//
//  String+.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 21/09/18.
//  Copyright © 2018 Everton Miranda Vitório. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {

    var isNil: Bool {
        return self == nil || self?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
    }
}

extension String {

    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
