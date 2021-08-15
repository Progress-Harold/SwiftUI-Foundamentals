//
//  Order.swift
//  SwiftUI-Appetizers
//
//  Created by Lee Davis on 8/14/21.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items = [Appetizer]()
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at index: IndexSet) {
        items.remove(atOffsets: index)
    }
}
