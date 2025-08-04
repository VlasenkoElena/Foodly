//
//  OrderView.swift
//  Foodly
//
//  Created by Helen on 11.07.2025.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { order in
                            FoodlyCellView(foodInfo: order)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        
                    } label: {
                        FoodButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 25)
                }
                if order.items.isEmpty {
                    EmptyStateView(imageName: "empty-order", message: "You have no items in your order.  \nPlease add any food.")
                }
              }
                .navigationTitle("🧾 Orders")
            }
        
    }
}

#Preview {
    OrderView()
}
