//
//  CustomButtonModifire.swift
//  Foodly
//
//  Created by Helen on 29.07.2025.
//

import SwiftUI

struct StandartButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
