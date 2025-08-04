//
//  StyleImageModifyre.swift
//  Foodly
//
//  Created by Helen on 30.07.2025.
//

import SwiftUI

struct StyleImageModifire: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 120, height: 90)
            .cornerRadius(8)
    }
}
