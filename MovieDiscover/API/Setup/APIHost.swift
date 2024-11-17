//
//  APIHost.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import Foundation

enum APIHost {
    static var baseURL: URL {
        let urlString = "https://api.themoviedb.org/3"
        
        guard let url = URL(string: urlString) else {
            fatalError("URL não suportada")
        }
        
        return url
    }

    
    static var apiKey: String {
        return "?api_key=88ee9533acb6d4f3193bab7b9d06e012"
    }
}
