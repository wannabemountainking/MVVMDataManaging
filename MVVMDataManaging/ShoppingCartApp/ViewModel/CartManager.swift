//
//  CartViewModel.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/2/25.
//

import Foundation
import Combine


class CartManager: ObservableObject {
    var productList: [CartItem] = [
        CartItem(title: "headPhone", unitPrice: 50_000, imageName: "headphones"),
        CartItem(title: "watch", unitPrice: 300_000, imageName: "watch.analog"),
        CartItem(title: "phone", unitPrice: 800_000, imageName: "smartphone"),
        CartItem(title: "laptop", unitPrice: 1_200_000, imageName: "laptopcomputer"),
        CartItem(title: "tablet", unitPrice: 600_000, imageName: "ipad"),
        CartItem(title: "airpods", unitPrice: 200_000, imageName: "airpodspro"),
        CartItem(title: "keyboard", unitPrice: 150_000, imageName: "keyboard"),
        CartItem(title: "mouse", unitPrice: 80_000, imageName: "computermouse"),
        CartItem(title: "monitor", unitPrice: 500_000, imageName: "display"),
        CartItem(title: "speaker", unitPrice: 180_000, imageName: "hifispeaker"),
        CartItem(title: "camera", unitPrice: 1_500_000, imageName: "camera"),
        CartItem(title: "printer", unitPrice: 250_000, imageName: "printer"),
        CartItem(title: "router", unitPrice: 120_000, imageName: "wifi.router"),
        CartItem(title: "hard drive", unitPrice: 100_000, imageName: "externaldrive"),
        CartItem(title: "usb cable", unitPrice: 30_000, imageName: "cable.connector"),
        CartItem(title: "power bank", unitPrice: 70_000, imageName: "battery.100"),
        CartItem(title: "smart tv", unitPrice: 1_800_000, imageName: "tv"),
        CartItem(title: "game console", unitPrice: 450_000, imageName: "gamecontroller"),
        CartItem(title: "vr headset", unitPrice: 900_000, imageName: "visionpro"),
        CartItem(title: "drone", unitPrice: 1_100_000, imageName: "airplane"),
        CartItem(title: "smart light", unitPrice: 45_000, imageName: "lightbulb"),
        CartItem(title: "thermostat", unitPrice: 180_000, imageName: "thermometer"),
        CartItem(title: "door lock", unitPrice: 220_000, imageName: "lock"),
        CartItem(title: "security cam", unitPrice: 150_000, imageName: "video"),
        CartItem(title: "microphone", unitPrice: 130_000, imageName: "mic"),
        CartItem(title: "webcam", unitPrice: 95_000, imageName: "web.camera"),
        CartItem(title: "smart watch", unitPrice: 400_000, imageName: "applewatch"),
        CartItem(title: "fitness band", unitPrice: 80_000, imageName: "heart"),
        CartItem(title: "earbuds", unitPrice: 120_000, imageName: "earbuds"),
        CartItem(title: "charging pad", unitPrice: 60_000, imageName: "powerplug")
    ]
    
    @Published var cartItems: [CartItem] = []
    
    var totalPrice: Int {
        let linePrices = cartItems.map { $0.unitPrice * $0.quantity }
        return linePrices.reduce(0, +)
    }
    
    var numberOfCartItems: Int {
        cartItems.map { $0.quantity }.reduce(0, +)
    }
    
    func addToCart(product: CartItem) {
        guard let index = cartItems.firstIndex(where: { $0.id == product.id }) else {
            cartItems.append(product)
            return
        }
        cartItems[index].quantity += 1
    }
    
    func removeFromCart(id: UUID) {
        cartItems.removeAll(where: { $0.id == id && $0.quantity >= 0 })
    }
    
    func updateQuantity(id: UUID, quantity: Int) {
        guard let index = cartItems.firstIndex(where: { $0.id == id }) else {return}
        cartItems[index].quantity = quantity
    }
    
    func clearCart() {
        cartItems.removeAll()
    }
}

