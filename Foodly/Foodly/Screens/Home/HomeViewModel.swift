//
//  HomeViewModel.swift
//  Foodly
//
//  Created by Helen on 18.07.2025.
//

import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var foodly: [Foodly] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    init() {}
  
    func getFoodly() {
        isLoading = true
        
        Task {
            do {
                foodly = try await NetworkManager.shared.getFoodly()
                isLoading = false
            } catch {
                if let foodError = error as? FoodError {
                    switch foodError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unabledToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else  {
                    alertItem = AlertContext.genericError
                    isLoading = false
                }
            }
        }
    }
}
