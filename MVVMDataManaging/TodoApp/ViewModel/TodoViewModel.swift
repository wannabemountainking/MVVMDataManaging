//
//  TodoViewModel.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/1/25.
//

import Foundation
import Combine


class TodoViewModel: ObservableObject {
    
    @Published var todos: [Todo] = []
    @Published var newTodoText: String = ""
    
    var completedCount: Int {
        return todos.filter { $0.isDone }.count
    }
    
    func addTodo() {
        let newTodo = Todo(content: newTodoText)
        if !newTodo.content.isEmpty {
            todos.append(newTodo)
            UserDefaults.standard.set(newTodo, forKey: newTodo.id)
            newTodoText = ""
        }
    }
    
    func toggleDone(id: String) {
        guard let index = todos.firstIndex(where: { $0.id == id }) else { return }
        todos[index].isDone.toggle()
        UserDefaults.standard.set(todos[index], forKey: todos[index].id)
    }
    
    func deleteTodo(id: String) {
        todos.removeAll(where: { $0.id == id })
    }
}
