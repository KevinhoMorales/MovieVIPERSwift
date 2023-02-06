//
//  ListOfMoviesPresenter.swift
//  MovieVIPERSwift
//
//  Created by Kevin Morales on 2/5/23.
//

import Foundation

protocol ListOfMoviesUI {
    func update(movies: [PopularMovieEntity])
}

final class ListOfMoviesPresenter {
    var ui: ListOfMoviesUI?
    
    private let listOfMovieInteractor: ListOfMoviesInteractor
    
    init(listOfMovieInteractor: ListOfMoviesInteractor) {
        self.listOfMovieInteractor = listOfMovieInteractor
    }
    
    func onViewAppear() {
        Task {
            let models = await listOfMovieInteractor.getListOfMovies()
            ui?.update(movies: models.results)
        }
    }
}
