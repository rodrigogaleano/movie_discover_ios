//
//  MovieItemViewModel.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import Foundation

class MovieItemViewModel {
    private var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}

extension MovieItemViewModel: MovieItemViewModelProtocol {
    var title: String {
        self.movie.title
    }
}
