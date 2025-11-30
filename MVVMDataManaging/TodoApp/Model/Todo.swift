//
//  Todo.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/1/25.
//

import Foundation


struct Todo: Identifiable {
    let id = UUID().uuidString
    let content: String
    var isDone: Bool = false
}
