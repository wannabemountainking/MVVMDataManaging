//
//  ProductListView.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/2/25.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var cartManger: CartManager
    
    var body: some View {
        ScrollView {
            ForEach($cartManger.cartItems) { $cartItem in
                ProductView(cartItem: cartItem)
            }//: ForEach
        }//: ScrollView
        .environmentObject(cartManger)
        
        Spacer()
        
        HStack(spacing: 10) {
            Image(systemName: "cart")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
            Text("\(cartManger.cartItems.count)")
        }
    }//: body
}

//#Preview {
//    ProductListView()
//}
