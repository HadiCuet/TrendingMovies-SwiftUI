//
//  ContentView.swift
//  TrendingMovies-SwiftUI
//
//  Created by Abdullah Al Hadi on 6/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var searchTask: Task<Void, Never>? = nil
    @State private var movieResults = [MovieResult]()
    @State private var movieSearchQuery: String = ""
    private let movieService = MovieService(clientService: ClientService())

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(movieResults) { item in
                        NavigationLink {
                            Text(item.title)
                        } label: {
                            ItemView(movieItem: item)
                        }
                    }
                    .padding()
                }
            }
            .task { runSearch() }
            .navigationTitle("Movie List")
            .searchable(text: $movieSearchQuery, prompt: "Search movie")
            .onSubmit(of: .search) { runSearch() }
            .onChange(of: movieSearchQuery) { _ in
                runSearch()
            }
        }
    }

    func runSearch() {
        searchTask?.cancel()
        searchTask = Task {
            if movieSearchQuery.isEmpty {
                movieResults = await movieService.getTrendingMovies()
            } else {
                movieResults = await movieService.searchMovie(byString: movieSearchQuery)
            }
        }
    }
}

#Preview {
    ContentView()
}
