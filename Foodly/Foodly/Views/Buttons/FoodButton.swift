//
//  FoodButton.swift
//  Foodly
//
//  Created by Helen on 23.07.2025.
//

import SwiftUI

struct FoodButton: View {
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    FoodButton(title: "")
}
