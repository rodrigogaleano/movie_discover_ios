//
//  HomeViewModel.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import Foundation

class HomeViewModel {
    @Published private var movies: [Movie] = []
    @Published private var errorMessage: String?
    
    private var getTopRatedMoviesUsecase: GetTopRatedMoviesUseCaseProtocol
    
    init(getTopRatedMoviesUsecase: GetTopRatedMoviesUseCaseProtocol) {
        self.getTopRatedMoviesUsecase = getTopRatedMoviesUsecase
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    var moviesViewModels: [any MovieItemViewModelProtocol] {
        self.movies.map { MovieItemViewModel(movie: $0) }
    }
    
    func loadContent() {
        getTopRatedMoviesUsecase.execute { movies in
            self.movies = movies
        } failure: { error in
            self.errorMessage = error
        }
    }
}
