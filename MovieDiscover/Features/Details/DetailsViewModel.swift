//
//  DetailsViewModel.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import Foundation

class DetailsViewModel {
    @Published var isLoading: Bool = true
    @Published private var movie: Movie?
    
    private var movieId: Int
    private var getMovieDetailsUseCase: GetMovieDetailsUseCaseProtocol
    
    init(movieId: Int, getMovieDetailsUseCase: GetMovieDetailsUseCaseProtocol) {
        self.movieId = movieId
        self.getMovieDetailsUseCase = getMovieDetailsUseCase
    }
}

extension DetailsViewModel: DetailsViewModelProtocol {
    var year: String {
        self.movie?.releaseYear ?? ""
    }
    
    var posterURL: URL? {
        movie?.posterURL
    }
    
    var overview: String {
        movie?.overview ?? ""
    }
    
    var title: String {
        self.movie?.title ?? ""
    }
    
    func loadContent() {
        self.isLoading = true
        getMovieDetailsUseCase.execute(movieId: self.movieId) { movie in
            self.movie = movie
            self.isLoading = false
        } failure: { error in
            // TODO: Show a error placeholder
            self.isLoading = true
        }
    }
}
