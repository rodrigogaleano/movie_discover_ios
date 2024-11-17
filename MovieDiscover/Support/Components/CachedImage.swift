//
//  CachedImage.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import SwiftUI

struct CachedImage: View {
    let imageURL: URL?
    
    var body: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Rectangle()
                .fill(.gray)
        }
    }
}

#Preview {
    CachedImage(imageURL: moviesMock[0].posterURL)
}
