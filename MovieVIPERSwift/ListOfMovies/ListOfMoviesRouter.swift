//
//  ListOfMoviesRouter.swift
//  MovieVIPERSwift
//
//  Created by Kevin Morales on 2/5/23.
//

import UIKit

final class ListOfMoviesRouter {
    func showListOfMovies(window: UIWindow?) {
        let view = ListOfMoviesView()
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfMovieInteractor: interactor)
        presenter.ui = view
        view.presenter = presenter
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
