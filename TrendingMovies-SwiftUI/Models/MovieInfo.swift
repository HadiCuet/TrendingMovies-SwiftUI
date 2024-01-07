//
//  MovieInfo.swift
//  TrendingMovies-SwiftUI
//
//  Created by Abdullah Al Hadi on 7/1/24.
//

import Foundation

struct MovieInfo: Decodable {
    let results: [MovieResult]
}

struct MovieResult: Decodable, Identifiable {
    let poster_path: String?
    let title: String
    let overview: String

    var id: UUID? {
        return UUID()
    }
}
