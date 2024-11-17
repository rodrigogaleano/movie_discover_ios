//
//  APIProvider.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import Moya
import Foundation

class APIProvider<T: APITarget> {
    
    private lazy var provider = MoyaProvider<T>(
        endpointClosure: { $0.endPoint },
        plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))]
    )
    
    func request(target: T, completion: @escaping Completion) {
        provider.request(target) { [weak self] result in
            switch result {
            case .success(let response):
                self?.handleResponse(response, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func handleResponse(_ response: Response, completion: @escaping Completion) {
        guard (200...299).contains(response.statusCode) else {
            return completion(.failure(MoyaError.statusCode(response)))
        }
        completion(.success(response))
    }
}
