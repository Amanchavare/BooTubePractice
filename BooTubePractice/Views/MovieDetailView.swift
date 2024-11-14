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
