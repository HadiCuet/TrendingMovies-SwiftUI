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
    func sendRequest<T: Decodable>(_ request: Requestable) async throws -> T {
        let urlRequest = try request.makeURLRequest()

        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}
