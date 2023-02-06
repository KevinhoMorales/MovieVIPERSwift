//
//  ListOfMoviesInteractor.swift
//  MovieVIPERSwift
//
//  Created by Kevin Morales on 2/5/23.
//

import Foundation

final class ListOfMoviesInteractor {
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=91380f96fa2addf2dfb94d48397cf8da")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}
