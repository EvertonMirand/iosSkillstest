//
//  UsersModels.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 22/09/18.
//  Copyright (c) 2018 Everton Miranda Vitório. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates
//
//  Type "usecase" for some magic!

struct UsersScene {

    struct FetchUsers {

        struct Request {

        }

        struct Response {
            enum State {
                case sucess([User])
                case failure(errorMessage: String)
            }

            let state: State
        }

        struct ViewModel {
            struct User {
                let email: String
                let name: String
            }
            let users: [User]
        }
    }

    struct GetLoggedUser {

        struct Request { }

        struct Response {
            let user: User
        }

        struct ViewModel {
            struct User {
                let email: String
                let name: String
            }

            let user: User
        }
    }

    struct DeleteUser {

        struct Request {
            let selectedUserEmail: String
        }

        struct Response {
            enum State {
                case sucess(message: String, index: Int)
                case failure(errorMessage: String)
            }
            let state: State
        }

        struct ViewModel {
            let message: String
            let index: Int
        }
    }
}
