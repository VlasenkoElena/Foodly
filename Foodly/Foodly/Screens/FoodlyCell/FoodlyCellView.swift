//
//  FoodlyView.swift
//  Foodly
//
//  Created by Helen on 14.07.2025.
//

import SwiftUI

struct FoodlyCellView: View {
    var foodInfo: Foodly
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: foodInfo.imageURL)) { image in
                image
                 .resizable()
                 .modifier(StyleImageModifire())
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .modifier(StyleImageModifire())
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(foodInfo.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(foodInfo.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    FoodlyCellView(foodInfo: MockData.sampleFoodly)
}
