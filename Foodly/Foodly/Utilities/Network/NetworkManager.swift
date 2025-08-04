//
//  NetworkManager.swift
//  Foodly
//
//  Created by Helen on 16.07.2025.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let foodlyURL = "Contents.json"
    
    private init() {}
    
    func loadJSON<T: Decodable>(_ filename: String) -> T {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Couldn't find \(filename).json in main bundle.")
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't load \(filename).json: \(error)")
        }
    }
    
    func getFoodly() async throws -> [Foodly]  {
        guard let url = URL(string: foodlyURL) else {
            throw FoodError.invalidURL
        }
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            fatalError("Couldn't find \("data").json in main bundle.")
        }
        
      //  let(data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(FoodlyResponse.self, from: data).request
        } catch {
            fatalError("Couldn't load \("data").json: \(error)")
        }
                  
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            }

//            do {
//                let decoder = JSONDecoder()
//                return try decoder.decode(FoodlyResponse.self, from: data).request
//            } catch {
//                throw FoodError.invalidData
//            }
//        }

    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
