//
//  SeriesResponse.swift
//  BooTubePractice
//
//  Created by Aman Niranjan Chavare on 13/11/24.
//

import Foundation

// Response model for fetching Series
struct SeriesResponse: Codable {
    let series: [Series]
    
    // Specify the key mapping for the "Search" array in JSON for Series
    enum CodingKeys: String, CodingKey {
        case series = "Search"
    }
}

struct Series: Codable, Identifiable {
    let id: String
    let title: String
    let year: String
    let poster: String
    var plot: String?  // Optional to allow updates later

    // Map `id` to `imdbID` from the JSON response for Series
    enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case plot = "Plot"  // Include plot key for the detailed API response
    }
}


