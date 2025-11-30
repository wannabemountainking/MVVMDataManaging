//
//  WelcomeView.swift
//  MVVMDataManaging
//
//  Created by YoonieMac on 11/30/25.
//

import SwiftUI

struct WelcomeView: View {
    @AppStorage("username") var username = ""
    @AppStorage("isDarkMode") var isDarkMode = false
    @AppStorage("isNotificationOn") var isNotificationOn = true
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7).ignoresSafeArea()
            VStack(spacing: 20) {
                HStack {
                    Text("환영합니다, \(username)님!")
                        .padding()
                    Spacer()
                }
                
                HStack {
                    Text("Dark Mode")
                        .fontWeight(.ultraLight)
                        .padding()
                    Spacer()
                    Text(isDarkMode ? "On" : "Off")
                        .padding()
                }
                
                HStack {
                    Text("Notification")
                        .fontWeight(.ultraLight)
                        .padding()
                    Spacer()
                    Text(isNotificationOn ? "On" : "Off")
                }
                
                NavigationLink {
                    //destination
                    SettingsView()
                } label: {
                    Text("설정을 변경하시겠습니까?")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(13)
                        .padding(.horizontal, 30)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .font(.title)
            .foregroundStyle(.white)
            .padding()
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    WelcomeView()
}
