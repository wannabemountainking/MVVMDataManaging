//
//  CartItemsView.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/3/25.
//

import SwiftUI

struct CartItemsView: View {
    @EnvironmentObject var cartManager: CartManager
    @Binding var cartItem: CartItem
    
    var body: some View {
        VStack(spacing: 50) {
            HStack(spacing: 30) {
                Image(systemName: cartItem.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                Text(cartItem.title)
                    .font(.largeTitle)
            }
            HStack(spacing: 10) {
                Text("\(cartItem.unitPrice.formatted(.number))원")
                Text("×")
                Text("\(cartItem.quantity)개")
            }
            .font(.title)
            
            HStack(spacing: 10) {

                Stepper(
                    "수량") {
                        //onIncrement
                        cartItem.quantity += 1
                    } onDecrement: {
                        cartItem.quantity -= 1
                    }
                    .frame(maxWidth: 100)
                
                Button {
                    //action
                    cartManager.removeFromCart(id: cartItem.id)
                } label: {
                    Text("삭제")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(10)
                        .padding(.horizontal, 30)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}



