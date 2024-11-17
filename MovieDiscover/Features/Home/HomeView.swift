//
//  HomeView.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
                VStack {
                    Spacer()
                    TabView {
                        ForEach(0..<10) { index in
                            MovieItemView()
                                .tag(index)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .automatic))
                    Spacer()
                }
            .navigationTitle("Discover Movies")
        }
    }
}

#Preview {
    HomeView()
}
