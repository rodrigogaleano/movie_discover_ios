//
//  GetTopRatedMoviesUseCase.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import Foundation

typealias Success = (([Movie]) -> Void)
typealias Failure = ((String) -> Void)

protocol GetTopRatedMoviesUseCaseProtocol {
    func execute(success: Success?, failure: Failure?)
}

class GetTopRatedMoviesUseCase: GetTopRatedMoviesUseCaseProtocol {
    private let movieRoutes: MovieRoutesProtocol

    init(movieRoutes: MovieRoutesProtocol) {
        self.movieRoutes = movieRoutes
    }

    func execute(success: Success?, failure: Failure?) {
        movieRoutes.getTopRatedMovies { result in
            switch result {
            case .success(let response):
                do {
                    let results = try response.map(MovieResult.self)
                    let movies = results.results
                    
                    success?(movies)
                } catch {
                    failure?("Error decoding data")
                }
            case .failure(let error):
                failure?(error.localizedDescription)
            }
        }
    }
}
