//
//  MovieRoutes.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import Moya

protocol MovieRoutesProtocol {
    func getTopRatedMovies(completion: @escaping Completion)
    func getMovieDetails(id: Int, completion: @escaping Completion)
}

class MovieRoutes {
    enum Target: APITarget {
        case topRatedMovies
        case movieDetails(id: Int)
        
        var path: String {
            switch self {
            case .topRatedMovies:
                return "/movie/top_rated"
            case .movieDetails(let id):
                return "/movie/\(id)"
            }
        }
        
        var method: Moya.Method { .get }
        
        var task: Moya.Task { .requestPlain }
    }
    
    private let provider = APIProvider<Target>()
}

extension MovieRoutes: MovieRoutesProtocol {
    func getTopRatedMovies(completion: @escaping Moya.Completion) {
        provider.request(target: .topRatedMovies, completion: completion)
    }
    
    func getMovieDetails(id: Int, completion: @escaping Moya.Completion) {
        provider.request(target: .movieDetails(id: id), completion: completion)
    }
}
