//
//  File.swift
//  Foodly
//
//  Created by Helen on 14.07.2025.
//

import Foundation

struct Foodly: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct FoodlyResponse: Decodable {
    let request: [Foodly]
}

struct MockData {
    
    static let sampleFoodly = Foodly(id: 01, name: "Test Foodly", description: "Test description", price: 9.99, imageURL: "asian-flank-steak", calories: 120, protein: 20, carbs: 3)
    
    static let foodly = [sampleFoodly, sampleFoodly, sampleFoodly, sampleFoodly]
}
