//
//  UsersConfigurator.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 22/09/18.
//  Copyright (c) 2018 Everton Miranda Vitório. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension UsersInteractor: UsersViewControllerOutput, UsersRouterDataSource, UsersRouterDataDestination {
}

extension UsersPresenter: UsersInteractorOutput {
}

class UsersConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = UsersConfigurator()
    
    private init() {}
    
    // MARK: Configuration
    
    func configure(viewController: UsersViewController) {
        
        let presenter = UsersPresenter()
        presenter.output = viewController
        
        let interactor = UsersInteractor()
        interactor.output = presenter
        
        let router = UsersRouter(viewController: viewController, dataSource: interactor, dataDestination: interactor)
        
        viewController.output = interactor
        viewController.router = router
    }
}
