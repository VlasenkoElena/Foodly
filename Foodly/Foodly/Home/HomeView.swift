//
//  HomeView.swift
//  Foodly
//
//  Created by Helen on 11.07.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var foodly: [Foodly] = []
    
    var body: some View {
        NavigationStack {
            List(foodly) { food in
                FoodlyCellView(foodInfo: food)
            }
            .navigationTitle("🥗 Foodly")
        }
        .onAppear {
            getFoodly()
        }
    }
    
    func getFoodly() {
        NetworkManager.shared.getFoodly { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let foodly):
                    self.foodly = foodly
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
