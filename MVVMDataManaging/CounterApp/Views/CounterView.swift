//
//  CounterView.swift
//  MVVMDataManaging
//
//  Created by YoonieMac on 11/30/25.
//

import SwiftUI

struct CounterView: View {
    @StateObject var counterVM = CounterViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                VStack(spacing: 20) {
                    Text("COUNT")
                    Text("\(counterVM.count)")
                        .contentTransition(.numericText())
                        .animation(.spring(), value: counterVM.count)
                }
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .padding(.vertical, 30)
                
                HStack(spacing: 20) {
                    
                    // 증가 버튼
                    Button {
                        // destination
                        counterVM.increment()
                    } label: {
                        Text("증가")
                    }
                    .buttonStyle(CounterButtonStyle(color: .blue))

                    Button {
                        //destination
                        counterVM.decrement()
                    } label: {
                        Text("감소")
                    }
                    .buttonStyle(CounterButtonStyle(color: .blue))
                    
                    // 감소
                    Button {
                        //destination
                        counterVM.reset()
                    } label: {
                        Text("리셋")
                    }
                    .buttonStyle(CounterButtonStyle(color: .blue))
                    
                }
                
                NavigationLink {
                    //destination
                    CounterDetailView(counterViewModel: counterVM)
                } label: {
                    Text("Count에 대해 알아보기")
                }
                .buttonStyle(CounterButtonStyle(color: .blue))
                .padding(.vertical, 30)
                             
            }
        }
        
    }
}

struct CounterButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .padding(13)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(.bouncy), value: configuration.isPressed)
    }
}

#Preview {
    CounterView()
}
