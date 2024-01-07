//
//  ClientService.swift
//  TrendingMovies-SwiftUI
//
//  Created by Abdullah Al Hadi on 6/1/24.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(_ request: Requestable) async throws -> T
}

class ClientService: HTTPClient {
    func sendRequest<T>(_ request: Requestable) async throws -> T where T : Decodable {
        let urlRequest = try request.makeURLRequest()

        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        

        throw NetworkError.invalidURL
    }
}
