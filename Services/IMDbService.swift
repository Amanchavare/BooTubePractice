//
//  IMDbService.swift
//  BooTubePractice
//
//  Created by Aman Niranjan Chavare on 13/11/24.
//

import Foundation

class IMDbService {
    let apiKey = "582cf673" // Replace with your actual API key
    
    func fetchHorrorMovies(completion: @escaping ([Movie]?) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?apikey=\(apiKey)&s=horror&type=movie") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedResponse.movies)
                    }
                } catch {
                    print("Failed to decode: \(error)")
                    completion(nil)
                }
            } else {
                print("Error fetching data: \(String(describing: error))")
                completion(nil)
            }
        }.resume()
    }
    
    
    func fetchHorrorSeries(completion: @escaping ([Series]?) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?apikey=\(apiKey)&s=horror&type=series") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(SeriesResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedResponse.series)
                    }
                } catch {
                    print("Failed to decode: \(error)")
                    completion(nil)
                }
            } else {
                print("Error fetching data: \(String(describing: error))")
                completion(nil)
            }
        }.resume()
    }
    
    
    func fetchSeriesDetails(imdbID: String, completion: @escaping (Series?) -> Void) {
            guard let url = URL(string: "https://www.omdbapi.com/?apikey=\(apiKey)&i=\(imdbID)&plot=full") else { return }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let seriesDetails = try JSONDecoder().decode(Series.self, from: data)
                        DispatchQueue.main.async {
                            completion(seriesDetails)
                        }
                    } catch {
                        print("Failed to decode details: \(error)")
                        completion(nil)
                    }
                } else {
                    print("Error fetching details: \(String(describing: error))")
                    completion(nil)
                }
            }.resume()
        }

}
