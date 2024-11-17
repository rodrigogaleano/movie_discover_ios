//
//  HomeView.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    var isLoading: Bool { get }
    var moviesViewModels: [any MovieItemViewModelProtocol] { get }
    
    func loadContent()
}

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                LoadingView()
            } else {
                TabView {
                    ForEach(viewModel.moviesViewModels.indices, id: \.self) { index in
                        let currentViewModel = viewModel.moviesViewModels[index]
                        
                        MovieItemView(viewModel: currentViewModel)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .automatic))
            }
        }
        .navigationTitle("Discover Movies")
        .onAppear {
            viewModel.loadContent()
        }
    }
}

#Preview {
    HomeFactory.home()
}
