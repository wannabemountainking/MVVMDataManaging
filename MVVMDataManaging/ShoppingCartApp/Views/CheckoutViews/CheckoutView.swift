//
//  CheckoutView.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/3/25.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var cartManager: CartManager
    @AppStorage("name") var name = ""
    @AppStorage("address") var address = ""
    @AppStorage("phoneNumber") var phoneNumber = ""
    
    var body: some View {
        VStack(spacing: 20) {
            List {
                Section("주문 내역") {
                    ForEach(cartManager.cartItems) { item in
                        LabeledContent(item.title) {
                            Text("× \(item.quantity)")
                            Spacer()
                        }
                    }
                }
                
                Section("배송 정보") {
                    
                    LabeledContent("이름") {
                        TextField("이름 입력", text: $name)
                    }
                    
                    LabeledContent("주소") {
                        TextField("주소 입력", text: $address)
                    }
                    
                    LabeledContent("전화번호") {
                        TextField("전화번호 입력", text: $phoneNumber)
                    }
                    
                }
                
                Section("총 구매 금액") {
                    HStack {
                        Text("총 결제 금액: ")
                        Text("\(cartManager.totalPrice)원")
                    }
                    Button("주문 완료") {
                        cartManager.clearCart()
                    }
                }
            }//: list
        }//: VStack
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
    }//: body
}

#Preview {
    CheckoutView()
        .environmentObject(CartManager())
}
