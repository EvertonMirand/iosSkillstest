//
//  AlbunsViewController.swift
//  iosSkillstest
//
//  Created by Everton Miranda Vitório on 22/09/18.
//  Copyright (c) 2018 Everton Miranda Vitório. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import UIKit
import Kingfisher

protocol AlbunsViewControllerInput {
    func displayError(error: String)
    func displayAlbuns(viewModel: AlbunsScene.FetchAlbuns.ViewModel)
}

protocol AlbunsViewControllerOutput {
    func fetchAlbuns(request: AlbunsScene.FetchAlbuns.Request)
}

class AlbunsViewController: UIViewController, AlbunsViewControllerInput {
    
    // Mark: Propeties
    
    var output: AlbunsViewControllerOutput?
    var router: AlbunsRouter?
    var albunsRow: [AlbunsScene.FetchAlbuns.ViewModel.AlbumRow] = []
    
    // Mark: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AlbunsConfigurator.sharedInstance.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAlbuns()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        albunsRow = []
    }
    
    // MARK: Requests
    
    func fetchAlbuns() {
        let request = AlbunsScene.FetchAlbuns.Request()
        output?.fetchAlbuns(request: request)
    }

    // MARK: Display logic

    func displayError(error: String) {
        displayErrorAlert(with: error)
    }

    func displayAlbuns(viewModel: AlbunsScene.FetchAlbuns.ViewModel) {
        albunsRow = viewModel.albumRows
        tableView.reloadData()
    }
}

extension AlbunsViewController {

    private func registerCells() {
        let detailOffersNib = UINib(nibName: AlbumTableViewCell.cellIdentifier, bundle: nil)
        tableView.register(detailOffersNib,
                           forCellReuseIdentifier: AlbumTableViewCell.cellIdentifier)
    }
}

//This should be on configurator but for some reason storyboard doesn't detect ViewController's name if placed there
extension AlbunsViewController: AlbunsPresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScene(for: segue)
    }
}
