//
//  LoginRouter.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 22/09/18.
//  Copyright (c) 2018 Everton Miranda Vitório. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol LoginRouterInput {
    
}

protocol LoginRouterDataSource: class {
    var logedUser: User? { get }
}

protocol LoginRouterDataDestination: class {
}

class LoginRouter: LoginRouterInput {
    
    struct SegueIdentifiers {
        static let tabBarScene = "TabBarScene"
    }
    
    weak var viewController: LoginViewController!
    weak private var dataSource: LoginRouterDataSource!
    weak var dataDestination: LoginRouterDataDestination!
    
    init(viewController: LoginViewController, dataSource: LoginRouterDataSource, dataDestination: LoginRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    // MARK: Navigation
    
    func navigateToTabBarScene() {
        viewController.performSegue(withIdentifier: SegueIdentifiers.tabBarScene, sender: self)
    }
    
    // MARK: Communication
    
    func passDataToNextScene(for segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        guard let identifier = segue.identifier else { return }
        switch identifier {
        case SegueIdentifiers.tabBarScene:
            passDataTabBarScene(for: segue)
            return
        default:
            return
        }
    }
    
    func passDataTabBarScene(for segue: UIStoryboardSegue) {
        if let tabBarViewController = segue.destination as? TabBarViewController {
            tabBarViewController.router?.dataDestination.user = dataSource.logedUser
        }
    }
}
