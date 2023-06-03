//
//  ViewController.swift
//  ReshenieTestApp
//
//  Created by Yulia Ignateva on 01.06.2023.
//

import UIKit

class FilmsViewController: UIViewController, FilmsModelDelegate {
    private var filmsModel: FilmsModel? = nil
    private var filmsView: FilmView? = nil
    private var filmsTableViewDataSource: FilmsTableViewDataSource? = nil
    private var loadingView: LoadingView? = nil
    private var loadingErrorView: LoadingErrorView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        view.backgroundColor = .white
        
        let filmsModel = FilmsModel()
        self.filmsModel = filmsModel
        filmsModel.delegate = self

        filmsModel.viewDidLoad()
    }
    
    func showLoadingView() {
        let loadingView = LoadingView()
        self.loadingView = loadingView
        
        view.addSubview(loadingView)
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loadingView.leftAnchor.constraint(equalTo: view.leftAnchor),
            loadingView.rightAnchor.constraint(equalTo: view.rightAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func showFilmsView(from data: [Info]) {
        let filmsTableViewDataSource = FilmsTableViewDataSource(films: data)
        self.filmsTableViewDataSource = filmsTableViewDataSource

        let filmsView = FilmsView(tableViewDataSource: filmsTableViewDataSource, tableViewDelegate: filmsTableViewDataSource, identifierCell: filmsTableViewDataSource.reuseIdentifier)

        view.addSubview(filmsView)

        filmsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filmsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filmsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            filmsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            filmsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func showLoadingErrorView() {
        let loadingErrorView = LoadingErrorView()
        self.loadingErrorView = loadingErrorView
        
        loadingView?.removeFromSuperview() // ??
        view.addSubview(loadingErrorView)
        
        loadingErrorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingErrorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loadingErrorView.leftAnchor.constraint(equalTo: view.leftAnchor),
            loadingErrorView.rightAnchor.constraint(equalTo: view.rightAnchor),
            loadingErrorView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        // MARK: - configure background color
        navigationBar.backgroundColor = .white
        
        // MARK: - configure title
        let titleLabel = UILabel()
        let title = NSAttributedString(
            string: "Фильмы",
            attributes: [
                .font: UIFont.specialFont(size: 25, style: .medium),
                .foregroundColor: UIColor.black
            ]
        )
        
        titleLabel.attributedText = title
        titleLabel.textAlignment = .left
        
        navigationBar.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: navigationBar.leftAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -5)
        ])
        
        // MARK: - configure searchButton
        let searchIcon = UIImage(named: "SearchIcon")?.withTintColor(UIColor(named: "CustomColor")!, renderingMode: .alwaysOriginal)
        let searchButton = UIBarButtonItem(image: searchIcon, style: .plain, target: self, action: #selector(didTapSearchButton))
        navigationItem.rightBarButtonItem = searchButton
    }
    
    @objc private func didTapSearchButton() {
        print("Search")
    }
}

