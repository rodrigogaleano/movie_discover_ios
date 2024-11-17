//
//  MovieItemView.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import SwiftUI

protocol MovieItemViewModelProtocol {
    var title: String { get }
}

struct MovieItemView: View {
    @State private var isShowing = false
    
    var viewModel: any MovieItemViewModelProtocol
    
    var body: some View {
        VStack(spacing: 24) {
            ZStack {
                Circle()
                    .stroke(.blue, lineWidth: 56)
                    .frame(width: 96, height: 96)
                    .offset(y: isShowing ? -96 : 0)
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.black)
                    .shadow(radius: 20, y: isShowing ? 28 : 0)
            }
            Text(viewModel.title)
                .font(.title2)
        }
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
