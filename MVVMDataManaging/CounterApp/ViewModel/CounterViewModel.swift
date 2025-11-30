//
//  CounterViewModel.swift
//  MVVMDataManaging
//
//  Created by YoonieMac on 11/30/25.
//

import Foundation
import Combine

class CounterViewModel: ObservableObject {
    
    @Published var count: Int = 0
    
    init() {
        self.count = UserDefaults.standard.integer(forKey: "lastCount")
    }
    
    var isEven: Bool { count.isMultiple(of: 2) }
    var evenOddText: String { isEven ? "짝수입니다": "홀수입니다" }
    var isOverTen: Bool { count >= 10 }
    var rangeText: String { isOverTen ? "10 이상입니다" : "10 미만입니다" }
    
    func increment() {
        count += 1
        UserDefaults.standard.set(count, forKey: "lastCount")
    }
    func decrement() {
        count -= 1
        UserDefaults.standard.set(count, forKey: "lastCount")
    }
    func reset() {
        count = 0
        UserDefaults.standard.set(count, forKey: "lastCount")
    }
}
