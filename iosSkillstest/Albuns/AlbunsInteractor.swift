//
//  AlbunsInteractor.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 22/09/18.
//  Copyright (c) 2018 Everton Miranda Vitório. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import Alamofire

protocol AlbunsInteractorInput {
    
}

protocol AlbunsInteractorOutput {
    
}

protocol AlbunsDataSource {
    
}

protocol AlbunsDataDestination {
    
}

protocol AlamofireAlbumUrl {
    var albumURL: String { get }
}

extension AlamofireAlbumUrl {

    var albumURL: String {
        return "https://jsonplaceholder.typicode.com/photos"
    }
}

class AlbunsInteractor: AlbunsInteractorInput, AlbunsDataSource, AlbunsDataDestination {
    
    var output: AlbunsInteractorOutput?
    
    // MARK: Business logic
    

}
