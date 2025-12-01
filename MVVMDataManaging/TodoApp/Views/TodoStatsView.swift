//
//  TodoStatsView.swift
//  MVVMDataManaging
//


import SwiftUI

struct TodoStatsView: View {
    @ObservedObject var todoViewModel: TodoViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Form {
                    Text("전체 할 일: \(todoViewModel.totalCount)개")
                    Text("완료: \(todoViewModel.completedCount)개")
                    Text("미완료: \(todoViewModel.notCompletedCount)개")
                    Text("완료율: \(todoViewModel.completionRate)%")
                } //: Form
                .font(.title2)
                .fontWeight(.ultraLight)
                .navigationTitle("할 일 통계")
                .navigationBarTitleDisplayMode(.inline)
                
                Button {
                    //action
                    dismiss()
                } label: {
                    Text("뒤로 가기")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .background(Color.green.opacity(0.9))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }//: Button
            }//: VStack
            .padding(20)
        }//: NavigationStack
    }//: body
}

#Preview {
    TodoStatsView(todoViewModel: TodoViewModel())
}
