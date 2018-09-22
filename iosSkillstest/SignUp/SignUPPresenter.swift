//
//  SignUPPresenter.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 21/09/18.
//  Copyright (c) 2018 Everton Miranda Vitório. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

protocol SignUPPresenterInput {
    func presentSignUP(reponse: SignUPScene.SignUP.Response)
}

protocol SignUPPresenterOutput: class {
    func displaySucess(viewModel: SignUPScene.SignUP.ViewModel)
    func displayFailure(viewModel: SignUPScene.SignUP.ViewModel)
}

class SignUPPresenter: SignUPPresenterInput {
    
    weak var output: SignUPPresenterOutput?
    
    // MARK: Presentation logic
    
    func presentSignUP(reponse: SignUPScene.SignUP.Response) {
        
        switch reponse.state {
        case .sucess(message: let message):
            let viewModel = SignUPScene.SignUP.ViewModel(message: message)
            output?.displaySucess(viewModel: viewModel)
        case .failure(errorMessage: let message):
            let viewModel = SignUPScene.SignUP.ViewModel(message: message)
            output?.displayFailure(viewModel: viewModel)
        }
    }
    
}
