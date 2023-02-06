//
//  ListOfMoviesView.swift
//  MovieVIPERSwift
//
//  Created by Kevin Morales on 2/5/23.
//

import Foundation

import UIKit

final class ListOfMoviesView: UIViewController {
    // MARK: - Public properties
    var presenter: ListOfMoviesPresenter?
    // MARK: - Private properties
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        presenter?.onViewAppear()
    }
    
    // MARK: - Helpers
    
    // MARK: - Actions
}

// MARK: - Extensions here

extension ListOfMoviesView: ListOfMoviesUI {
    func update(movies: [PopularMovieEntity]) {
        print("Data -> \(movies)")
    }
}
