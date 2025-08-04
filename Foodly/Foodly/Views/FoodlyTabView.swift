//
//  ContentView.swift
//  Foodly
//
//  Created by Helen on 11.07.2025.
//

import SwiftUI

struct FoodlyTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
                .badge(order.items.count)
        }
        .accentColor(.brandPrimary)
    }
}

#Preview {
    FoodlyTabView()
}
