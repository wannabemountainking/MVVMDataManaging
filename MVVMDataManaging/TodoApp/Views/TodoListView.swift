//
//  TodoListView.swift
//  MVVMDataManaging
//
//  Created by YoonieMac on 12/1/25.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var todoVM: TodoViewModel = TodoViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Form {
                    TextField("새 할 일", text: $todoVM.newTodoText)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Button {
                        //action
                        if !todoVM.newTodoText.isEmpty {
                            todoVM.addTodo()
                        }
                    } label: {
                        Text("추가")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(height: 35)
                            .frame(maxWidth: .infinity)
                            .background(Color.teal)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
                
                Form {
                    List {
                        ForEach($todoVM.todos) { $todo in
                            HStack(spacing: 20) {
                                Button {
                                    //action
                                    todoVM.toggleTodo(id: todo.id)
                                } label: {
                                    Image(systemName: todo.isDone ? "checkmark.square" : "square")
                                        .font(.title3)
                                        .foregroundStyle(todo.isDone ? .green : .red)
                                }
                                
                                Text(todo.content)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .strikethrough(todo.isDone, color: .red)
                            }
                        }
                    }
                }
                .padding()
                
                Form {
                    VStack(spacing: 20) {
                        Text("완료: \(todoVM.completedCount) / \(todoVM.todos.count)")
                            .font(.title)
                            .fontWeight(.ultraLight)
                        
                        NavigationLink {
                            TodoStatsView(todoViewModel: todoVM)
                        } label: {
                            Text("통계 보기 ➣")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                                .padding(10)
                                .padding(.horizontal, 10)
                                .background(Color.cyan)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }

                    }

                }
            }//: VStack
            .navigationTitle("What To Do")
            .navigationBarTitleDisplayMode(.inline)
        }//: NavigationStack
    }//: body
}

#Preview {
    TodoListView()
}
