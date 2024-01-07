//
//  Requestable.swift
//  TrendingMovies-SwiftUI
//
//  Created by Abdullah Al Hadi on 6/1/24.
//

import Foundation

protocol Requestable {
    var baseURLString: String { get }

    var path: String { get }

    var method: HTTPMethod { get }

    var headers: [String: Any]? { get }

    var bodyDict: [String: Any]? { get }

    var parameters: [String: Any]? { get }

    var httpBody: Data? { get }

    var cachePolicy: URLRequest.CachePolicy { get }

    var timeoutInterval: TimeInterval { get }

    func makeURLRequest() throws -> URLRequest
}

extension Requestable {
    var baseURLString: String {
        "https://api.themoviedb.org/"
    }

    var method: HTTPMethod {
        .get
    }

    var headers: [String: Any]? {
        nil
    }

    var bodyDict: [String: Any]? {
        nil
    }

    var parameters: [String: Any]? {
        nil
    }

    var httpBody: Data? {
        nil
    }

    var cachePolicy: URLRequest.CachePolicy {
        .useProtocolCachePolicy
    }

    var timeoutInterval: TimeInterval {
        20
    }

    func makeURLRequest() throws -> URLRequest {
        let fullURLString = baseURLString + path
        guard var urlComponent = URLComponents(string: fullURLString) else {
            throw NetworkError.invalidURL
        }
        if let parameters {
            var queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                let query = URLQueryItem(name: key, value: value as? String)
                queryItems.append(query)
            }
            urlComponent.queryItems = queryItems
        }
        guard let url = urlComponent.url else {
            throw NetworkError.invalidURL
        }

        var urlRequest = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)

        urlRequest.httpMethod = method.rawValue
        if let headers = headers as? [String: String] {
            urlRequest.allHTTPHeaderFields = headers
        }
        if let httpBody {
            urlRequest.httpBody = httpBody
        }

        return urlRequest
    }
}
