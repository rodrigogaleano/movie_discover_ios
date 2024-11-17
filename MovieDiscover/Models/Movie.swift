//
//  Movie.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import Foundation

struct MovieResult: Decodable {
    var results: [Movie]
}

struct Movie: Decodable {
    var id: Int
    var title: String
    var overview: String
    var posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
    }
    
    var posterURL: URL? {
        guard
            let posterPath = posterPath,
            let url = URL(string: "https://image.tmdb.org/t/p/w185\(posterPath)")
        else { return nil }
        
        return url
    }
}

let moviesMock: [Movie] = [
    Movie(
        id: 1,
        title: "Title 1",
        overview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In malesuada condimentum diam, vel consectetur magna ullamcorper volutpat. Duis mi sapien, ultricies venenatis malesuada ac, maximus eget nisi.",
        posterPath: "/gCI2AeMV4IHSewhJkzsur5MEp6R.jpg"
    ),
    Movie(
        id: 2,
        title: "Title 2",
        overview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In malesuada condimentum diam, vel consectetur magna ullamcorper volutpat. Duis mi sapien, ultricies venenatis malesuada ac, maximus eget nisi.",
        posterPath: "/gCI2AeMV4IHSewhJkzsur5MEp6R.jpg"
    ),
]
