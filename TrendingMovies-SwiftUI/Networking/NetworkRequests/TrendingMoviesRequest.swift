//
//  TrendingMoviesRequest.swift
//  TrendingMovies-SwiftUI
//
//  Created by Abdullah Al Hadi on 7/1/24.
//

import Foundation

class TrendingMoviesRequest: Requestable {
    var path: String
    var parameters: [String: Any]?

    init() {
        path = "3/discover/movie"
        self.parameters = ["api_key": "38e61227f85671163c275f9bd95a8803"]
    }
}
