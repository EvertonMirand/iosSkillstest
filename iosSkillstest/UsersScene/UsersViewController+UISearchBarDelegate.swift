//
//  UsersViewController+UISearchBarDelegate.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 23/09/18.
//  Copyright © 2018 Everton Miranda Vitório. All rights reserved.
//

import Foundation
import UIKit

extension UsersViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSFilteringUsers = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredUsers = users.filter{ (user) -> Bool in
            user.email.lowercased().contains(searchText.lowercased())
        }
        tablewView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSFilteringUsers = false
        searchBar.resignFirstResponder()
    }
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSFilteringUsers = false
        searchBar.resignFirstResponder()
        tablewView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSFilteringUsers = false
        searchBar.resignFirstResponder()
    }
}
