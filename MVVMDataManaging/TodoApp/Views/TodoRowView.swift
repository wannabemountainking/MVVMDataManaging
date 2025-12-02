//
//  TodoRowView.swift
//  MVVMDataManaging
//
//  Created by YoonieMac on 12/2/25.
//

import SwiftUI


struct TodoRowView: View {
    @ObservedObject var viewModel: TodoViewModel
    @Binding var todo: Todo
    
    var body: some View {

            HStack(spacing: 20) {
                Button {
                    //action
                    viewModel.toggleTodo(id: todo.id)
                } label: {
                    Image(systemName: todo.isDone ? "checkmark.square" : "square")
                        .font(.title3)
                        .foregroundStyle(todo.isDone ? .green : .red)
                }
                
                Text(todo.content)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .strikethrough(todo.isDone, color: .red)
                
                Spacer()
                
                Button("삭제", role: .destructive) {
                    viewModel.deleteTodo(id: todo.id)
                }
            }//: HStack
            .buttonStyle(.plain)
    }
}

