//
//  CounterDetailView.swift
//  MVVMDataManaging
//
//  Created by YoonieMac on 11/30/25.
//

import SwiftUI

struct CounterDetailView: View {
    @ObservedObject var counterViewModel: CounterViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text(counterViewModel.evenOddText)
                .padding(10)
                .padding(.horizontal, 10)
                .background(Color.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(counterViewModel.rangeText)
                .padding(10)
                .padding(.horizontal, 10)
                .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .font(.title)
        .fontWeight(.semibold)
        .foregroundStyle(.white)
        .navigationTitle("카운트 상세")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CounterDetailView(counterViewModel: CounterViewModel())
}
