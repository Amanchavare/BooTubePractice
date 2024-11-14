//
//  HomeView.swift
//  BooTubePractice
//
//  Created by Aman Niranjan Chavare on 13/11/24.
//

import SwiftUI

struct MovieView: View {
    @StateObject private var viewModel = MovieViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Horror Movies")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 16)
                    
                    MovieCarouselView(movies: viewModel.movies)
                    
                    Text("New Releases")
                        .font(.title2)
                        .bold()
                        .padding(.leading, 16)
                    
                    MovieCategoryGridView(movies: viewModel.movies)
                }
//                .background(Color.black.ignoresSafeArea())
            }
            .background(Color.black.ignoresSafeArea())
            .foregroundColor(.white)
        }
        .navigationBarHidden(true)
    }
}


