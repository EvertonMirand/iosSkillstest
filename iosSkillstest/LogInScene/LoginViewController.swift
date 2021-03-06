//
//  LoginViewController.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 22/09/18.
//  Copyright (c) 2018 Everton Miranda Vitório. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit
import RealmSwift
import SkyFloatingLabelTextField
import SVProgressHUD

protocol LoginViewControllerInput {
    func displaySucessLogin(viewModel: LoginScene.Login.ViewModel)
    func displayFailureLogin(viewModel: LoginScene.Login.ViewModel)
}

protocol LoginViewControllerOutput {
    func login(request: LoginScene.Login.Request)
}

class LoginViewController: UIViewController, LoginViewControllerInput {

    // MARK: Propeties

    var output: LoginViewControllerOutput?
    var router: LoginRouter?

    // MARK: Outlets

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailText: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordText: SkyFloatingLabelTextField!

    // MARK: Object lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        LoginConfigurator.sharedInstance.configure(viewController: self)
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    // MARK: Requests

    func login() {
        let email = clearText(from: emailText)
        guard email.isValidEmail() else {
            return
        }
        let password = clearText(from: passwordText)
        let request = LoginScene.Login.Request(email: email, password: password)
        SVProgressHUD.show()
        output?.login(request: request)
    }

    // MARK: Display logic

    func displaySucessLogin(viewModel: LoginScene.Login.ViewModel) {
        SVProgressHUD.dismiss()
        displaySuccessfuAlert(with: viewModel.message)
        router?.navigateToTabBarScene()
    }

    func displayFailureLogin(viewModel: LoginScene.Login.ViewModel) {
        SVProgressHUD.dismiss()
        displayErrorAlert(with: viewModel.message)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: IBAction

extension LoginViewController {

    @IBAction func login(_ sender: Any) {
        login()
    }
}

// MARK: Text Field

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailText:
            passwordText.becomeFirstResponder()
        case passwordText:
            passwordText.resignFirstResponder()
            loginButton.sendActions(for: .touchUpInside)
        default:
            passwordText.resignFirstResponder()
        }
        return false
    }
}

//This should be on configurator but for some reason storyboard doesn't detect ViewController's name if placed there
extension LoginViewController: LoginPresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScene(for: segue)
    }
}
