//
//  FilmsView.swift
//  ReshenieTestApp
//
//  Created by Yulia Ignateva on 01.06.2023.
//

import UIKit

final class FilmsView: UIView {
    var tableViewDataSource: UITableViewDataSource? {
        get {
            tableView.dataSource
        }
        set {
            tableView.dataSource = newValue
        }
    }
    var tableViewDelegate: UITableViewDelegate? {
        get {
            tableView.delegate
        }
        set {
            tableView.delegate = newValue
        }
    }
    private let identifierCell: String
    private let tableView = UITableView()
    
    init(tableViewDataSource: UITableViewDataSource, tableViewDelegate: UITableViewDelegate, identifierCell: String) {
        self.identifierCell = identifierCell
        super.init(frame: .zero)
        self.tableViewDelegate = tableViewDelegate
        self.tableViewDataSource = tableViewDataSource
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        tableView.register(FilmsCell.self, forCellReuseIdentifier: identifierCell)
        
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

struct Genre {
    let name: String
    let year: Int
}

final class FilmsCell: UITableViewCell {
    private var filmView: FilmView? = nil
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(title: String, genre: Genre, icon: UIImage) {
        let filmView = FilmView(title: title, genre: genre, icon: icon)
        self.filmView = filmView
        
        backgroundColor = .none
        
        contentView.addSubview(filmView)
        
        filmView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filmView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            filmView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            filmView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            filmView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10)
        ])
    }
}

final class FilmView: UIView {
    private let title: String
    private let genre: Genre
    private let icon: UIImage
    private let iconView = UIImageView()
    private let titleLabel = UILabel()
    private let genreLabel = UILabel()
    
    init(title: String, genre: Genre, icon: UIImage) {
        self.title = title
        self.genre = genre
        self.icon = icon
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        configureIconView()
        configureTitleLabel()
        configureGenreLabel()
        setupShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10
        layer.masksToBounds = false
        layer.cornerRadius = 8.0
    }
    
    private func configureIconView() {
        iconView.image = icon
        
        addSubview(iconView)
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            iconView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            iconView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
    
    private func configureTitleLabel() {
        titleLabel.text = title
        titleLabel.font = UIFont.specialFont(size: 16, style: .medium)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 1
        
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 26),
            titleLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 15),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -50)
        ])
    }
    
    private func configureGenreLabel() {
        genreLabel.text = "\(genre.name)" + " " + "(\(genre.year)"
        genreLabel.font = UIFont.specialFont(size: 14, style: .medium)
        genreLabel.textColor = .gray
        genreLabel.numberOfLines = 1
        
        addSubview(genreLabel)
        
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            genreLabel.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 15),
            genreLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -27)
        ])
    }
}

