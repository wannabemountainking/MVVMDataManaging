//
//  Owner.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/2/25.
//

import Foundation


struct Customer: Identifiable {
    let id = UUID()
    let name: String
    var address: String
    var phoneNumber: String
}
