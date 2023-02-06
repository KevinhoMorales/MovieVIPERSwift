//
//  ListOfMoviesPresenter.swift
//  MovieVIPERSwift
//
//  Created by Kevin Morales on 2/5/23.
//

import Foundation

protocol ListOfMoviesPresentable: AnyObject {
    var ui: ListOfMoviesUI? { get }
    var listOfMovieTableCellViewModel: [ListOfMovieTableCellViewModel] { get }
    func onViewAppear()
}

protocol ListOfMoviesUI: AnyObject {
    func update(movies: [ListOfMovieTableCellViewModel])
}

final class ListOfMoviesPresenter: ListOfMoviesPresentable {
    weak var ui: ListOfMoviesUI?
    var listOfMovieTableCellViewModel: [ListOfMovieTableCellViewModel] = []

    private let listOfMovieInteractor: ListOfMoviesInteractable
    private let mapper: Mapper
    
    init(listOfMovieInteractor: ListOfMoviesInteractable, mapper: Mapper = Mapper()) {
        self.listOfMovieInteractor = listOfMovieInteractor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            let models = await listOfMovieInteractor.getListOfMovies().results
            listOfMovieTableCellViewModel = models.map(mapper.map(entity:))
            ui?.update(movies: listOfMovieTableCellViewModel)
        }
    }
}
