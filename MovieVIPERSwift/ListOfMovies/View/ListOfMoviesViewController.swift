//
//  ListOfMoviesViewController.swift
//  MovieVIPERSwift
//
//  Created by Kevin Morales on 2/5/23.
//

import UIKit

final class ListOfMoviesViewController: UIViewController {
    // MARK: - Public properties
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ListOfMovieTableViewCell.self, forCellReuseIdentifier: "LIST_OF_MOVIES_CELL_ID")
        return tableView
    }()
    
    private let presenter: ListOfMoviesPresentable
    // MARK: - Private properties
    
    init(presenter: ListOfMoviesPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewAppear()
        setUpView()
    }
    
    // MARK: - Helpers
    private func setUpView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        tableView.dataSource = self
        tableView.delegate = self
    }
    // MARK: - Actions
}

// MARK: - Extensions here

extension ListOfMoviesViewController: ListOfMoviesUI {
    func update(movies: [ListOfMovieTableCellViewModel]) {
        DispatchQueue.main.async { [ weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension ListOfMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.listOfMovieTableCellViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LIST_OF_MOVIES_CELL_ID", for: indexPath) as! ListOfMovieTableViewCell
        let movie = presenter.listOfMovieTableCellViewModel[indexPath.row]
        cell.setUpCell(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = presenter.listOfMovieTableCellViewModel[indexPath.row]
        print(movie.title)
    }
}
