//
//  MovieCategoryGridView.swift
//  BooTubePractice
//
//  Created by Aman Niranjan Chavare on 13/11/24.
//

import SwiftUI

struct MovieCategoryGridView: View {
    let movies: [Movie]
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            ForEach(movies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    VStack {
                        AsyncImage(url: URL(string: movie.poster)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 160, height: 240)
                        .cornerRadius(8)
                        
                        Text(movie.title)
                            .font(.caption)
                            .lineLimit(1)
                            .padding(.top, 5)
                    }
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                }
            }
        }
        .padding(.horizontal)
    }
}
