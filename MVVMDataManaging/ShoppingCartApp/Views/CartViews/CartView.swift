//
//  CartView.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/2/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("장바구니   (\(cartManager.cartItems.count))")
            
            ScrollView(.vertical) {
                ForEach($cartManager.cartItems) { $cartItem in
                    CartItemsView(cartItem: $cartItem)
                }
            }
        }//: VStack
        Divider()
        
        Text("총 금액: \(cartManager.totalPrice.formatted(.number))원")
        
        HStack(alignment: .center, spacing: 50) {
            Button {
                // action
                cartManager.clearCart()
            } label: {
                Text("전체 삭제")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(10)
                    .padding(.horizontal, 10)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            NavigationLink {
                // destination
                CheckoutView()
            } label: {
                Text("주문하기 ➤")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(10)
                    .padding(.horizontal, 10)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }//: HStack
        .padding(30)
    }//: body
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
