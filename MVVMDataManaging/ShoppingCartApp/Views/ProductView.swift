//
//  ProductView.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/3/25.
//

import SwiftUI

struct ProductView: View {
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
            
            Text("\(cartItem.unitPrice.formatted(.number))원")
            
            Button {
                //action
                cartManager.addToCart(product: cartItem)
            } label: {
                Text("장바구니 추가")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(10)
                    .padding(.horizontal, 10)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }//: VStack
        .environmentObject(cartManager)
    }//: body
}

//#Preview {
//    ProductView()
//}
