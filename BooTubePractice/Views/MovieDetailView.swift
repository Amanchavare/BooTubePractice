//
//  MovieDetailView.swift
//  BooTubePractice
//
//  Created by Aman Niranjan Chavare on 13/11/24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: movie.poster)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray
            }
            .frame(height: 400)
            
            Text(movie.title)
                .font(.largeTitle)
                .bold()
            
            Text("Released: \(movie.year)")
                .font(.subheadline)
                .padding(.top, 5)
            
            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
        .foregroundColor(.white)
    }
}
struct MovieCardView: View {
    let movie: Movie

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: movie.poster)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            } placeholder: {
                ProgressView()
            }
            Text(movie.title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top, 8)
        }
        .background(Color.black.opacity(0.7))
        .cornerRadius(10)
    }
}
