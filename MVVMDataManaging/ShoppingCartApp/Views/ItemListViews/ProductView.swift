//
//  ProductView.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/3/25.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: CartItem
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: product.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                Text(product.title)
                    .font(.title2)
                    .fontWeight(.ultraLight)
            }
            
            Text("\(product.unitPrice.formatted(.number))원")
                .font(.title2)
                .fontWeight(.ultraLight)
            
            Button {
                //action
                cartManager.addToCart(product: product)
            } label: {
                Text("장바구니 추가")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .padding(10)
                    .padding(.horizontal, 20)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }//: VStack
    }//: body
}

#Preview {
    ProductView(product: CartItem(title: "headphone", unitPrice: 50_000, imageName: "headphones"))
        .environmentObject(CartManager())
}
