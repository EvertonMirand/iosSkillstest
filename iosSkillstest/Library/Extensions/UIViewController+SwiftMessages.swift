//
//  File.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 21/09/18.
//  Copyright © 2018 Everton Miranda Vitório. All rights reserved.
//


import Foundation
import UIKit
import SwiftMessages

extension UIViewController {
    
    func displayErrorAlert(with message: String, and duration: TimeInterval = 2.5) {
        let displayErrorAlert = MessageView.viewFromNib(layout: .messageView)
        displayErrorAlert.id = message
        displayErrorAlert.configureTheme(.error)
        displayErrorAlert.iconLabel?.isHidden = true
        displayErrorAlert.button?.isHidden = true
        displayErrorAlert.iconImageView?.isHidden = true
        displayErrorAlert.configureContent(title: "", body: message)
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .top
        config.duration = .seconds(seconds: duration)
        SwiftMessages.show(config: config, view: displayErrorAlert)
    }
    
    func displaySuccessfuAlert(with message: String, and duration: TimeInterval = 2.5) {
        let displaySuccessfuAlert = MessageView.viewFromNib(layout: .messageView)
        displaySuccessfuAlert.configureTheme(.success)
        displaySuccessfuAlert.iconLabel?.isHidden = true
        displaySuccessfuAlert.button?.isHidden = true
        displaySuccessfuAlert.iconImageView?.isHidden = true
        displaySuccessfuAlert.configureContent(title: "", body: message)
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .top
        config.duration = .seconds(seconds: duration)
        SwiftMessages.show(config: config, view: displaySuccessfuAlert)
    }
    
    
}

