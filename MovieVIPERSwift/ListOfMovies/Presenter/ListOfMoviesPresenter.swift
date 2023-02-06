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
    var models: [PopularMovieEntity] = []
    
    init(listOfMovieInteractor: ListOfMoviesInteractor) {
        self.listOfMovieInteractor = listOfMovieInteractor
    }
    
    func onViewAppear() {
        Task {
            models = await listOfMovieInteractor.getListOfMovies().results
            ui?.update(movies: models)
        }
    }
}
