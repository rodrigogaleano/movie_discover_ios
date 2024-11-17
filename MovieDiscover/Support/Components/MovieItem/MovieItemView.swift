//
//  MovieItemView.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import SwiftUI

protocol MovieItemViewModelProtocol {
    var id: Int { get }
    var title: String { get }
    var posterURL: URL? { get }
}

struct MovieItemView: View {
    @State private var isShowing = false
    
    var viewModel: any MovieItemViewModelProtocol
    
    var body: some View {
        NavigationLink(
            destination: DetailsFactory.details(movieId: viewModel.id),
            label: {
                VStack(spacing: 24) {
                    ZStack {
                        Image("cd")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 156, height: 156)
                            .offset(y: isShowing ? -136 : 0)
                        CachedImage(imageURL: viewModel.posterURL)
                            .frame(width: 185, height: 278)
                            .cornerRadius(8)
                            .shadow(radius: 20, y: isShowing ? 28 : 0)
                    }
                    Text(viewModel.title)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                }
            }
        )
        .foregroundStyle(.black)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5)) {
                isShowing = true
            }
        }
        .onDisappear {
            withAnimation(.easeInOut(duration: 1.5)) {
                isShowing = false
            }
        }
    }
}

#Preview {
    let viewModel = MovieItemViewModel(movie: moviesMock[0])
    
    MovieItemView(viewModel: viewModel)
}
