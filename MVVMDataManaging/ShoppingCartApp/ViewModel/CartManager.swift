//
//  CartViewModel.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/2/25.
//

import Foundation
import Combine


class CartManager: ObservableObject {
    @Published var cartItems: [CartItem] = []
    
    var totalPrice: Int {
        let linePrices = cartItems.map { $0.unitPrice * $0.quantity }
        return linePrices.reduce(0, +)
    }
    
    func addToCart(product: CartItem) {
        cartItems.append(product)
    }
    
    func removeFromCart(id: UUID) {
        cartItems.removeAll(where: { $0.id == id })
    }
    
    func updateQuantity(id: UUID, quantity: Int) {
        guard let index = cartItems.firstIndex(where: { $0.id == id }) else {return}
        cartItems[index].quantity = quantity
    }
    
    func clearCart() {
        cartItems.removeAll()
    }
}

