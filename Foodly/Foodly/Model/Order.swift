//
//  Order.swift
//  Foodly
//
//  Created by Helen on 28.07.2025.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Foodly] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ foodly: Foodly) {
        items.append(foodly)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

}
