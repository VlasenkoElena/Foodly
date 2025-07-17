//
//  NetworkManager.swift
//  Foodly
//
//  Created by Helen on 16.07.2025.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let foodlyURL = baseURL + "appetizers"
    
    private init() {}
    
    func getFoodly(completed: @escaping (Result<[Foodly], FoodError>) -> Void) {
        guard let url = URL(string: foodlyURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unabledToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(FoodlyResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
