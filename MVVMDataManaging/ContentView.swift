//
//  ContentView.swift
//  MVVMDataManaging
//
//  Created by YoonieMac on 11/30/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CounterView(counterVM: CounterViewModel())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
