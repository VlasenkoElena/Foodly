//
//  FoodlyDetailsView.swift
//  Foodly
//
//  Created by Helen on 22.07.2025.
//

import SwiftUI

struct FoodlyDetailsView: View {
    
    @EnvironmentObject var order: Order
    
    let foodlyDetails: Foodly
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            FoodlyRemoteImage(urlString: foodlyDetails.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack{
                Text(foodlyDetails.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(foodlyDetails.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Callories", value: foodlyDetails.calories)
                    NutritionInfo(title: "Carbs", value: foodlyDetails.carbs)
                    NutritionInfo(title: "Protein", value: foodlyDetails.protein)
                }
            }
            
            Spacer()
            
            Button {
                order.add(foodlyDetails)
                isShowingDetail = false
            } label: {
                Text("$ \(foodlyDetails.price, specifier: "%.2f") - Add To Order")
            }
            .modifier(StandartButtonStyle())
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.medium)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
            }
        },  alignment: .topTrailing)
    }
}

#Preview {
    FoodlyDetailsView(foodlyDetails: MockData.sampleFoodly, isShowingDetail: .constant(true))
}

struct NutritionInfo: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .bold()
            Text("\(value) g")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
