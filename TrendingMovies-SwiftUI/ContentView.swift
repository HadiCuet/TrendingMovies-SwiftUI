//
//  ContentView.swift
//  TrendingMovies-SwiftUI
//
//  Created by Abdullah Al Hadi on 6/1/24.
//

import SwiftUI

struct ContentView: View {

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
            .onAppear {
                Task {
                    movieResults = await movieService.searchMovie(byString: "Marvel")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
