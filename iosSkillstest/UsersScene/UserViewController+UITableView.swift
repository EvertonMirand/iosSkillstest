//
//  UserViewController+UITableView.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 22/09/18.
//  Copyright © 2018 Everton Miranda Vitório. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if indexPath.section != 0 {
            let editAction = UITableViewRowAction(style: .normal, title: "Editar") { _, _ in
                self.editUser(at: indexPath)
                self.tablewView.isEditing = false
            }
            let removeAction = UITableViewRowAction(style: .destructive, title: "Remover") { _, _ in
                let email = self.getEmail(at: indexPath)
                self.showDeleteConfirmAction(with: email, at: indexPath)
                self.tablewView.isEditing = false
            }
            return [editAction, removeAction]
        }
        return []
    }

}

extension UsersViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            if isSFilteringUsers {
                return filteredUsers.count
            }
            return users.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") {
                guard let userName = loggedUser?.name else {
                    return cell
                }
                cell.isUserInteractionEnabled = false
                cell.textLabel?.text = userName
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") {
                var user: UsersScene.FetchUsers.ViewModel.User!
                if isSFilteringUsers {
                    user = filteredUsers[indexPath.row]
                } else {
                    user = users[indexPath.row]
                }
                cell.selectionStyle = .none
                cell.textLabel?.text = user.name
                return cell
            }
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Usuario Logado"
        }
        return "Usuarios cadastrados"
    }
}
