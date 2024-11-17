//
//  DetailsView.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import SwiftUI

protocol DetailsViewModelProtocol: ObservableObject {
    var year: String { get }
    var title: String { get }
    var isLoading: Bool { get }
    var posterURL: URL? { get }
    var overview: String { get }
    
    func loadContent()
}

struct DetailsView<ViewModel: DetailsViewModelProtocol>: View {
    @State var isInitialState: Bool = true
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if viewModel.isLoading {
                LoadingView()
            } else {
                ZStack {
                    Image("cd")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 196)
                        .offset(x: isInitialState ? 0 : 96)
                    CachedImage(imageURL: viewModel.posterURL)
                        .frame(width: 185, height: 278)
                        .cornerRadius(8)
                        .shadow(radius: 20, y: isInitialState ? 0 : 28)
                }
                .padding(.bottom)
                Text(viewModel.title)
                    .font(.title2)
                    .opacity(isInitialState ? 0 : 1)
                Text(viewModel.year)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .opacity(isInitialState ? 0 : 1)
                Text(viewModel.overview)
                    .offset(y: isInitialState ? 40 : 0)
                    .blur(radius: isInitialState ? 2 : 0)
                Spacer()
            }
        }
        .padding()
        .navigationTitle("Details")
        .onAppear {
            viewModel.loadContent()
        }
        .onChange(of: viewModel.isLoading, initial: false) {
            withAnimation(.easeInOut(duration: 1)) {
                isInitialState = false
            }
        }
    }
}

#Preview {
    DetailsFactory.details(movieId: 240)
}
