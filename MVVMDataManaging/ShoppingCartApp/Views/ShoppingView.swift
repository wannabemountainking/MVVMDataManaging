//
//  ProductListView.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/2/25.
//

import SwiftUI

struct ShoppingView: View {
    @StateObject private var cartManager = CartManager()
    
    var body: some View {
        TabView {
            Tab("products", systemImage: "bag.fill") {
                NavigationStack {
                    ProductListView()
                        .navigationTitle("Shopping Cart")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            
            Tab("cart", systemImage: "cart.fill") {
                NavigationStack {
                    CartView()
                        .navigationTitle("Shopping Cart")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            
            Tab("Checkout", systemImage: "creditcard") {
                NavigationStack {
                    CheckoutView()
                        .navigationTitle("Shopping Cart")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }//: TabView
        .environmentObject(cartManager)
    }//: body
}

#Preview {
    ShoppingView()
}
