//
//  DetailsFactory.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import SwiftUI

enum DetailsFactory {
    static func details(movieId: Int) -> some View {
        let movieRoutes = MovieRoutes()
        let getMovieDetailsUseCase = GetMovieDetailsUseCase(movieRoutes: movieRoutes)
        let viewModel = DetailsViewModel(movieId: movieId, getMovieDetailsUseCase: getMovieDetailsUseCase)
        
        return DetailsView(viewModel: viewModel)
    }
}
