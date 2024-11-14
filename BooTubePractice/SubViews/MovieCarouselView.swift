//
//  MovieCarouselView.swift
//  BooTubePractice
//
//  Created by Aman Niranjan Chavare on 13/11/24.
//

import SwiftUI

struct MovieCarouselView: View {
    let movies: [Movie]
    
    var body: some View {
        TabView {
            ForEach(movies) { movie in
                AsyncImage(url: URL(string: movie.poster)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(height: 250)
                .clipped()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 250)
        .padding(.bottom, 20)
    }
}
