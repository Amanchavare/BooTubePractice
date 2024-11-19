//
//  Recommender.swift
//  BooTubePractice
//
//  Created by Abhishek Chikhalkar on 19/11/24.
//
import CoreML

class RecommendationService {
    private let model: BHOOTUBE_1

    init() {
        do {
            self.model = try BHOOTUBE_1(configuration: MLModelConfiguration())
        } catch {
            fatalError("Failed to load Core ML model: \(error)")
        }
    }

    /// Fetching  user ratings from API and convert keys to String
    func fetchUserRatings(completion: @escaping ([String: Double]?) -> Void) {
        guard let url = URL(string: "http://www.omdbapi.com/?apikey=582cf673&i=tt1844624&plot=full&Ratings") else {
            print("Invalid URL")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Failed to fetch user ratings: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }

            do {
                // Decoding API response into [Int64: Double]
                let ratings = try JSONDecoder().decode([Int64: Double].self, from: data)

                // Convert keys to String
                let stringKeyedRatings = ratings.reduce(into: [String: Double]()) { result, pair in
                    result[String(pair.key)] = pair.value
                }

                completion(stringKeyedRatings)
            } catch {
                print("Failed to decode user ratings: \(error)")
                completion(nil)
            }
        }.resume()
    }

    /// Generate recommendations using Core ML
    func getRecommendations(for items: [String: Double], k: Int) -> [String]? {
        do {
            let input = BHOOTUBE_1Input(items: items, k: Int64(k))
            let prediction = try model.prediction(input: input)

            return prediction.recommendations
        } catch {
            print("Failed to make prediction: \(error)")
            return nil
        }
    }
}
    
