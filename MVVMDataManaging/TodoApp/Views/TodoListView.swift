//
//  TodoListView.swift
//  MVVMDataManaging
//


import SwiftUI


struct TodoListView: View {
    @StateObject var todoVM: TodoViewModel = TodoViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                TextField("새 할 일", text: $todoVM.newTodoText)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding()
                
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
                .padding()
                
                List {
                    ForEach($todoVM.todos) { $todo in
                        TodoRowView(
                            viewModel: todoVM,
                            todo: $todo
                            )
                    }//: Loop
                }//: List
                .padding()

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
                            .foregroundStyle(.indigo)
                    }//: NavigationLink
                }//: VStack

            }//: VStack
            .navigationTitle("What To Do")
            .navigationBarTitleDisplayMode(.inline)
        }//: NavigationStack
    }//: body
}

#Preview {
    
    TodoListView(todoVM: TodoViewModel())
}
