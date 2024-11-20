//
//  MovieResponse.swift
//  BooTubePractice
//
//  Created by Aman Niranjan Chavare on 13/11/24.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]
    
    // Specify the key mapping for the "Search" array in JSON
    enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Codable, Identifiable {
    let id: String
    let title: String
    let year: String
    let poster: String
    
    // Map `id` to `imdbID` from the JSON response
    enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
    }
}



