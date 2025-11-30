//
//  Todo.swift
//  MVVMDataManaging
//
//  Created by YoonieMac on 12/1/25.
//

import Foundation


struct Todo: Identifiable, Codable {
    let id: UUID
    let content: String
    var isDone: Bool
    
    init(id: UUID = UUID(), content: String, isDone: Bool = false) {
        self.id = id
        self.content = content
        self.isDone = isDone
    }
}
