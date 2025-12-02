//
//  CartItemsView.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/3/25.
//

import SwiftUI

struct CartItemsView: View {
    @EnvironmentObject var cartManager: CartManager
    var cartItem: CartItem
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: cartItem.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                Text(cartItem.title)
                    .font(.headline)
            }
            HStack(spacing: 10) {
                Text("\(cartItem.unitPrice.formatted(.number))원")
                Text("×")
                Text("\(cartItem.quantity)개")
            }
            
            HStack(spacing: 10) {
                
                Stepper(
                    "구입") {
                        //onIncrement
                        guard let index = cartManager.cartItems.firstIndex(where: { $0.id == cartItem.id }) else {return}
                        cartManager.cartItems[index].quantity += 1
                    } onDecrement: {
                        guard let index = cartManager.cartItems.firstIndex(where: { $0.id == cartItem.id }) else {return}
                        cartManager.cartItems[index].quantity -= 1
                    }

                
                Button {
                    //action
                    cartManager.removeFromCart(id: cartItem.id)
                } label: {
                    Text("삭제")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(10)
                        .padding(.horizontal, 10)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }

        }
    }
}


