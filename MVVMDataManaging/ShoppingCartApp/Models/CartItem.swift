//
//  Product.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/2/25.
//

import Foundation


struct CartItem: Identifiable {
    let id = UUID()
    let title: String
    var unitPrice: Int
    var linePrice: Int { return unitPrice * quantity }
    var imageName: String
    
    var quantity: Int = 1 {
        didSet {
            if quantity < 0 {
                quantity = oldValue
            }
        }
    }
}
