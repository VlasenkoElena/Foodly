//
//  ContentView.swift
//  Foodly
//
//  Created by Helen on 11.07.2025.
//

import SwiftUI

struct FoodlyTabView: View {
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
        }
        .accentColor(Color("brandPrimary"))
    }
}

#Preview {
    FoodlyTabView()
}
