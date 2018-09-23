//
//  UsersViewController.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 22/09/18.
//  Copyright (c) 2018 Everton Miranda Vitório. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit
import SVProgressHUD

protocol UsersViewControllerInput {
    func displayLoggedUser(viewModel: UsersScene.GetLoggedUser.ViewModel)
    func displayUsers(viewModel: UsersScene.FetchUsers.ViewModel)
    func displayError(error: String)
}

protocol UsersViewControllerOutput {
    func getLoggedUser(request: UsersScene.GetLoggedUser.Request)
    func fetchUsers(request: UsersScene.FetchUsers.Request)
    func deleteUser(request: UsersScene.DeleteUser.Request)
    func editUser(with email: String)
}

class UsersViewController: UIViewController, UsersViewControllerInput {

    // MARK: Propeties

    var output: UsersViewControllerOutput?
    var router: UsersRouter?
    var loggedUser: UsersScene.GetLoggedUser.ViewModel.User?
    var users: [UsersScene.FetchUsers.ViewModel.User] = []
    var filteredUsers: [UsersScene.FetchUsers.ViewModel.User] = []
    var isSFilteringUsers = false

    // MARK: Outlets

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tablewView: UITableView!

    // MARK: Object lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        UsersConfigurator.sharedInstance.configure(viewController: self)
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getLoggedUser()
        fetchUsers()
    }

    // MARK: Requests

    func getLoggedUser() {
        let request = UsersScene.GetLoggedUser.Request()
        output?.getLoggedUser(request: request)
    }

    func fetchUsers() {
        SVProgressHUD.show()
        let request = UsersScene.FetchUsers.Request()
        output?.fetchUsers(request: request)
    }

    func deleteUsers(indexPath: IndexPath) {

        SVProgressHUD.show()
        let email = getEmail(at: indexPath)
        let request = UsersScene.DeleteUser.Request(selectedUserEmail: email)
        self.output?.deleteUser(request: request)
    }

    func showDeleteConfirmAction(with email: String, at indexPath: IndexPath) {
        let deleteConfirmAlert = UIAlertController(title: "Deletar", message: "Deseja deletar o email \(email)", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirmar", style: .destructive) { _ in
            self.deleteUsers(indexPath: indexPath)
        }
        deleteConfirmAlert.addAction(confirmAction)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
        deleteConfirmAlert.addAction(cancelAction)
        present(deleteConfirmAlert, animated: true)
    }

    func getEmail(at indexPath: IndexPath) -> String {
        var email: String!
        if self.isSFilteringUsers {
            email = self.filteredUsers[indexPath.row].email
        } else {
            email = self.users[indexPath.row].email
        }
        return email
    }

    func editUser(at indexPath: IndexPath) {
        let email = getEmail(at: indexPath)
        output?.editUser(with: email)
        router?.navigateToSignUpScene()
    }

    // MARK: Display logic

    func displayLoggedUser(viewModel: UsersScene.GetLoggedUser.ViewModel) {
        loggedUser = viewModel.user
        let indexSet = IndexSet(integer: 0)
        tablewView.reloadSections(indexSet, with: .none)
    }

    func displayUsers(viewModel: UsersScene.FetchUsers.ViewModel) {
        SVProgressHUD.dismiss()
        users = viewModel.users
        tablewView.reloadData()
    }

    func displayError(error: String) {
        SVProgressHUD.dismiss()
        displayErrorAlert(with: error)
    }

    func displaySucessDeletedUser(viewModel: UsersScene.DeleteUser.ViewModel) {
        searchBar.endEditing(true)
        SVProgressHUD.dismiss()
        displaySuccessfuAlert(with: viewModel.message)
        users.remove(at: viewModel.index)
        let indexPath = IndexPath(row: viewModel.index, section: 1)
        tablewView.deleteRows(at: [indexPath], with: .fade)
    }

}

// MARK: IBActions

extension UsersViewController {

    @IBAction func addUser(_ sender: Any) {
        output?.editUser(with: "")
        router?.navigateToSignUpScene()
    }

    @IBAction func logout(_ sender: Any) {
        dismiss(animated: true)
    }
}

//This should be on configurator but for some reason storyboard doesn't detect ViewController's name if placed there
extension UsersViewController: UsersPresenterOutput {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScene(for: segue)
    }
}
