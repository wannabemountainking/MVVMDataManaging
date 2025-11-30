//
//  TodoViewModel.swift
//  MVVMDataManaging
//
//  Created by YoonieMac on 12/1/25.
//

import Foundation
import Combine

class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var newTodoText: String = ""
    
    private let todoKey: String = "savedTodos"
    var completedCount: Int {
        todos.filter { $0.isDone }.count
    }
    
    init() {
        loadTodos()
    }
    
    func loadTodos() {
        guard let data = UserDefaults.standard.data(forKey: todoKey),
              let decoded = try? JSONDecoder().decode([Todo].self, from: data) else {return}
        todos = decoded
    }
    
    func saveTodos() {
        guard let encoded = try? JSONEncoder().encode(todos) else {return}
        UserDefaults.standard.set(encoded, forKey: todoKey)
    }
    
    
    func addTodo() {
        let trimmed = newTodoText.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        let newTodo = Todo(content: trimmed)
        todos.append(newTodo)
        saveTodos()
        newTodoText = ""
    }
    
    func toggleTodo(id: UUID) {
        guard let index = todos.firstIndex(where: { $0.id == id }) else {return}
        todos[index].isDone.toggle()
        saveTodos()
    }
    
    func deleteTodo(id: UUID) {
        todos.removeAll(where: { $0.id == id })
        saveTodos()
    }
}
