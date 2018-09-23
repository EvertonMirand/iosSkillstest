//
//  UITextField+.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 21/09/18.
//  Copyright © 2018 Everton Miranda Vitório. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func clearText(from textField: UITextField, and errorMessage: String = "O campo não pode ser vazio!") -> String {
        if textField.text.isNil {
            displayErrorAlert(with: errorMessage)
            return ""
        }
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            displayErrorAlert(with: errorMessage)
            return ""
        }
        return text
    }

    func validateEmailFormat(_ email: String) -> Bool {
        if email.isValidEmail() {
            return true
        } else {
            displayErrorAlert(with: "Email em formato não valido")
            return false
        }
    }
}
