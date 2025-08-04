//
//  HomeView.swift
//  Foodly
//
//  Created by Helen on 11.07.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var isShowingDetail = false
    @State private var selectedFood: Foodly?
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.foodly) { food in
                    FoodlyCellView(foodInfo: food)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            selectedFood = food
                            isShowingDetail = true
                        }
                }
                .navigationTitle("🥗 Foodly")
                .disabled(isShowingDetail)
            }
            .task {
                viewModel.getFoodly()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if isShowingDetail {
                FoodlyDetailsView(foodlyDetails: selectedFood!, isShowingDetail: $isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    HomeView()
}
