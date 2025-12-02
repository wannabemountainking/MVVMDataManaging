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
        ZStack {
            Color.orange.ignoresSafeArea()
            
            TabView {
                Tab("products", systemImage: "bag.fill") {
                    ProductListView()
                }
                Tab("cart", systemImage: "cart.fill") {
                    CartView()
                }
            }//: TabView
            
        }//: ZStack
        .environmentObject(cartManager)
    }//: body
}

#Preview {
    ShoppingView()
}
