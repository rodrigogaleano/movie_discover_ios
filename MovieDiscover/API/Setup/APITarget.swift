//
//  APITarget.swift
//  MovieDiscover
//
//  Created by Rodrigo Galeano on 17/11/24.
//

import Moya
import Foundation

protocol APITarget: TargetType {
    var endPoint: Endpoint { get }
}

extension APITarget {
    var sampleData: Data { Data() }
    var task: Task { .requestPlain }
    var baseURL: URL { APIHost.baseURL }
    var apiKey: String { APIHost.apiKey }
    var headers: [String: String]? { nil }
    
    var endPoint: Endpoint {
        Endpoint(
            url: "\(baseURL)\(path)\(apiKey)",
            sampleResponseClosure: { .networkResponse(200, self.sampleData) },
            method: method,
            task: task,
            httpHeaderFields: headers
        )
    }
}
