//
//  MovieService.swift
//  TrendingMovies-SwiftUI
//
//  Created by Abdullah Al Hadi on 7/1/24.
//

import Foundation

class MovieService {

    let clientService: HTTPClient

    init(clientService: HTTPClient) {
        self.clientService = clientService
    }

    func getTrendingMovies() async -> [MovieResult] {
        do {
            let request = TrendingMoviesRequest()
            let movieInfo: MovieInfo = try await clientService.sendRequest(request)
            return movieInfo.results
        }
        catch {
            return []
        }
    }

    func searchMovie(byString query: String) async -> [MovieResult] {
        do {
            let request = SearchRequest(queryString: query)
            let movieInfo: MovieInfo = try await clientService.sendRequest(request)
            return movieInfo.results
        }
        catch {
            return []
        }
    }
}
