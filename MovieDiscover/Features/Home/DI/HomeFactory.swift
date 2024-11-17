//
//  HomeFactory.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import SwiftUI

enum HomeFactory {
    static func home() -> some View {
        let movieRoutes = MovieRoutes()
        let getTopRatedMoviesUsecase = GetTopRatedMoviesUseCase(movieRoutes: movieRoutes)
        let viewModel = HomeViewModel(getTopRatedMoviesUsecase: getTopRatedMoviesUsecase)
        
        return HomeView(viewModel: viewModel)
    }
}
