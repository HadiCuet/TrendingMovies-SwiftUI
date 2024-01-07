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

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            Task {
                let request = SearchRequest()
                do {
                    let movieInfo: MovieInfo = try await ClientService().sendRequest(request)
                    movieResults = movieInfo.results
                }
                catch {
                    print("Error")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
