//
//  ListOfMoviesInteractor.swift
//  MovieVIPERSwift
//
//  Created by Kevin Morales on 2/5/23.
//

import Foundation

protocol ListOfMoviesInteractable: AnyObject {
    func getListOfMovies() async -> PopularMovieResponseEntity
}

final class ListOfMoviesInteractor: ListOfMoviesInteractable {
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=91380f96fa2addf2dfb94d48397cf8da")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}


final class ListOfMoviesInteractorMock: ListOfMoviesInteractable {
    func getListOfMovies() async -> PopularMovieResponseEntity {
        return PopularMovieResponseEntity(results: [
            PopularMovieEntity(id: 0, title: "Kevinho Morales", overview: "VIPER", imageURL: "", votes: 10),
            PopularMovieEntity(id: 1, title: "Kevinho Morales", overview: "Rx Swift", imageURL: "", votes: 10),
            PopularMovieEntity(id: 2, title: "Kevinho Morales", overview: "MVVM", imageURL: "", votes: 10),
            PopularMovieEntity(id: 3, title: "Kevinho Morales", overview: "Swift UI", imageURL: "", votes: 10),
            PopularMovieEntity(id: 4, title: "Kevinho Morales", overview: "Unit Testing", imageURL: "", votes: 10),
            PopularMovieEntity(id: 5, title: "Kevinho Morales", overview: "iOS", imageURL: "", votes: 10)
        ])
    }
}
