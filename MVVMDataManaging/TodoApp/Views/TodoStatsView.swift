//
//  TodoStatsView.swift
//  MVVMDataManaging
//
//  Created by YoonieMac on 12/1/25.
//

import SwiftUI

struct TodoStatsView: View {
    @ObservedObject var todoViewModel: TodoViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
            }
        }

    }
}

#Preview {
    TodoStatsView(todoViewModel: TodoViewModel())
}
