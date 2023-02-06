//
//  Mapper.swift
//  MovieVIPERSwift
//
//  Created by Kevin Morales on 2/5/23.
//

import Foundation

struct Mapper {
    func map(entity: PopularMovieEntity) -> ListOfMovieTableCellViewModel {
        ListOfMovieTableCellViewModel(title: entity.title,
                                      overview: entity.overview,
                                      imageURL: URL(string: "https://image.tmdb.org/t/p/w200" + entity.imageURL))
    }
}
