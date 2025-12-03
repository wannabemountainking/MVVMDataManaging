//
//  ProductListView.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/2/25.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var cartManger: CartManager
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(cartManger.productList) { products in
                    ProductView(product: products)
                        .padding(.vertical, 15)
                }//: ForEach
            }//: LazyVGrid
        }//: ScrollView
        
        Spacer()
        
        HStack(spacing: 10) {
            Image(systemName: "cart")
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
            Text("\(cartManger.numberOfCartItems)")
        }
        .padding(20)
    }//: body
}

#Preview {
    ProductListView()
        .environmentObject(CartManager())
}
