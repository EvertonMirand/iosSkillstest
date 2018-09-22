//
//  UsersRouter.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 22/09/18.
//  Copyright (c) 2018 Everton Miranda Vitório. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol UsersRouterInput {
    
}

protocol UsersRouterDataSource: class {
    
}

protocol UsersRouterDataDestination: class {
    var user: User! { get set }
}

class UsersRouter: UsersRouterInput {
    
    var user: User!
    
    weak var viewController: UsersViewController!
    weak private var dataSource: UsersRouterDataSource!
    weak var dataDestination: UsersRouterDataDestination!
    
    init(viewController: UsersViewController, dataSource: UsersRouterDataSource, dataDestination: UsersRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    // MARK: Navigation
    
    // MARK: Communication
    
    func passDataToNextScene(for segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        
    }
}
