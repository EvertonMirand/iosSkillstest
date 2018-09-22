//
//  AlbunsRouter.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 22/09/18.
//  Copyright (c) 2018 Everton Miranda Vitório. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit

protocol AlbunsRouterInput {
    
}

protocol AlbunsRouterDataSource: class {
    
}

protocol AlbunsRouterDataDestination: class {
    
}

class AlbunsRouter: AlbunsRouterInput {
    
    weak var viewController: AlbunsViewController!
    weak private var dataSource: AlbunsRouterDataSource!
    weak var dataDestination: AlbunsRouterDataDestination!
    
    init(viewController: AlbunsViewController, dataSource: AlbunsRouterDataSource, dataDestination: AlbunsRouterDataDestination) {
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