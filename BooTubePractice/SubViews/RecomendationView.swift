//
//  RecomendationView.swift
//  BooTubePractice
//
//  Created by Abhishek Chikhalkar on 19/11/24.
//
//

import SwiftUI

struct RecommendationView: View {
    @State private var recommendedMovies: [Movie] = []
    @State private var isLoading = true

    private let recommendationService = RecommendationService()

    var body: some View {
        NavigationView {
            ScrollView {
                if isLoading {
                    ProgressView("Loading Recommendations...")
                        .padding()
                } else if recommendedMovies.isEmpty {
                    Text("No recommendations available")
                        .font(.headline)
                        .padding()
                } else {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(recommendedMovies) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                MovieDetailView(movie: movie)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Recommended Movies")
        }
        .onAppear(perform: loadRecommendations)
    }

    private func loadRecommendations() {
        isLoading = true

        recommendationService.fetchUserRatings { userRatings in
            guard let userRatings = userRatings else {
                DispatchQueue.main.async { isLoading = false }
                return
            }

            let k = 5 // Number of recommendations

            if let recommendedIDs = recommendationService.getRecommendations(for: userRatings, k: k) {
                // Fetch movie details based on recommended IDs
                fetchMovieDetails(for: recommendedIDs) { movies in
                    DispatchQueue.main.async {
                        self.recommendedMovies = movies
                        self.isLoading = false
                    }
                }
            } else {
                DispatchQueue.main.async { self.isLoading = false }
            }
        }
    }

    /// Fetch movie details by IDs
    private func fetchMovieDetails(for ids: [String], completion: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "http://www.omdbapi.com/?apikey=582cf673&i=tt1844624&plot=full&Ratings\(ids.joined(separator: ","))") else {
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Failed to fetch movie details: \(error)")
                completion([])
                return
            }

            guard let data = data else {
                completion([])
                return
            }

            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                completion(movies)
            } catch {
                print("Failed to decode movies: \(error)")
                completion([])
            }
        }.resume()
    }
}
