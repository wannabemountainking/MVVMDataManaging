//
//  IntroView.swift
//  MVVMDataManaging
//
//  Created by YoonieMac on 11/30/25.
//

import SwiftUI

struct IntroView: View {
    @AppStorage("username") var username: String = ""
    
    var body: some View {
        NavigationStack {
            if username.isEmpty {
                SettingsView()
            } else {
                WelcomeView()
            }
        }
    }
}

#Preview {
    IntroView()
}
