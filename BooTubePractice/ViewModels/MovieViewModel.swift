//
//  MovieViewModel.swift
//  BooTubePractice
//
//  Created by Aman Niranjan Chavare on 13/11/24.
//

import Foundation

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private let imdbService = IMDbService()
    
    init() {
        fetchHorrorMovies()
    }
    
    func fetchHorrorMovies() {
        imdbService.fetchHorrorMovies { [weak self] movies in
            if let movies = movies {
                self?.movies = movies
            }
        }
    }
}

