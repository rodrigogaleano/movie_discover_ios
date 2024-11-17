//
//  HomeFactory.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import SwiftUI

enum HomeFactory {
    static func home() -> some View {
        let getTopRatedMoviesUsecase = GetTopRatedMoviesUseCase()
        let viewModel = HomeViewModel(getTopRatedMoviesUsecase: getTopRatedMoviesUsecase)
        
        return HomeView(viewModel: viewModel)
    }
}
