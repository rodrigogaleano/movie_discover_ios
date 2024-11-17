//
//  HomeView.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    var moviesViewModels: [any MovieItemViewModelProtocol] { get }
    
    func loadContent()
}

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
                VStack {
                    Spacer()
                    TabView {
                        ForEach(viewModel.moviesViewModels.indices, id: \.self) { index in
                            let currentViewModel = viewModel.moviesViewModels[index]
                            
                            MovieItemView(viewModel: currentViewModel)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .automatic))
                    Spacer()
                }
            .navigationTitle("Discover Movies")
        }
        .onAppear {
            viewModel.loadContent()
        }
    }
}

#Preview {
    HomeFactory.home()
}
