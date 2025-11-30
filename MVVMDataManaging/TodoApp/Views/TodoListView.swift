//
//  TodoListView.swift
//  MVVMDataManaging
//
//  Created by yoonie on 12/1/25.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoViewModel = TodoViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Form {
                    // content
                    TextField("새로운 할 일", text: $viewModel.newTodoText)
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Button {
                        // action
                        viewModel.addTodo()
                    } label: {
                        Text("추가")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                Form {
                    List {
                        ForEach(viewModel.todos) { todo in
                            Text(todo.content)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TodoListView(viewModel: TodoViewModel())
}
