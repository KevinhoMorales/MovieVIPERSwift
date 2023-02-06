//
//  ListOfMoviesRouter.swift
//  MovieVIPERSwift
//
//  Created by Kevin Morales on 2/5/23.
//

import UIKit

final class ListOfMoviesRouter {
    func showListOfMovies(window: UIWindow?) {
//        let interactor = ListOfMoviesInteractorMock() // MOCK
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfMovieInteractor: interactor)
        let view = ListOfMoviesViewController(presenter: presenter)
        presenter.ui = view
        let nav = UINavigationController()
        nav.pushViewController(view, animated: true)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
    
    func showMovieDetail() {
        
    }
}
