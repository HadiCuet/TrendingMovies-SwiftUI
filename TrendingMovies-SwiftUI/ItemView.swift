//
//  ItemView.swift
//  TrendingMovies-SwiftUI
//
//  Created by Abdullah Al Hadi on 7/1/24.
//

import SwiftUI

struct ItemView: View {
    var movieItem: MovieResult

    var body: some View {
        HStack() {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(movieItem.poster_path ?? "")")) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 120)

            VStack(alignment: .leading, spacing: 20) {
                Text(movieItem.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(2)

                Text(movieItem.overview)
                    .font(.body)
                    .lineLimit(4)
            }

            Spacer()
        }
    }
}

#Preview {
    ItemView(movieItem: MovieResult(poster_path: nil, title: "Title", overview: "Overview Overview Overview Overview Overview Overview Overview Overview"))
}
