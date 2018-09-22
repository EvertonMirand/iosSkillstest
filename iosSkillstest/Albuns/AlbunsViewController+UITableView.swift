//
//  AlbunsViewController+UITableView.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 22/09/18.
//  Copyright © 2018 Everton Miranda Vitório. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension AlbunsViewController: UITableViewDelegate {
}

extension AlbunsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.cellIdentifier, for: indexPath)
        guard let albumCell = cell as? AlbumTableViewCell else {
            fatalError("Could not deque cell \(AlbumTableViewCell.cellIdentifier)")
        }
        let albumRow = albunsRow[indexPath.row]
        albumCell.albumTitle.text = albumRow.title
        let url = URL(string: albumRow.photoURL)
        albumCell.imageView?.kf.setImage(with: url)
        return albumCell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albunsRow.count
    }
    
}
